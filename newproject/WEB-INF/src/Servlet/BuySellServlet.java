package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Asset;
import bean.History;
import bean.Price;
import bean.User;
import dao.PurchaseDAO;
import dao.SellDAO;

//買い注文、売り注文であるか判別し、適切なページにフォワーディング
//銘柄にまつわる情報をsessionに格納

@WebServlet("/buysellaction")
public class BuySellServlet extends HttpServlet {
	public static void main(String[] args) throws SQLException {
		//暫定的にsession生成
		User user = new User();
//		user.setMoney(1600000);
		user.setId("admin");
//		user.setSimulationDate(Date.valueOf("2020-6-1"));
		//		session.setAttribute("user", user);
		int stock_code=2503;
		System.out.println(BuySellServlet.getAveragePrice(user, stock_code));

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ

		String forwardURL = null;
		String errorURL = "error";
		String button = req.getParameter("button");
		System.out.println(button);

		HttpSession session = req.getSession();

		//暫定的にsession生成
		//		User user = new User();
		//		user.setMoney(1600000);
		//		user.setId("admin");
		//		user.setSimulationDate(Date.valueOf("2020-6-1"));
		//		session.setAttribute("user", user);
		User user = (User) session.getAttribute("user");

		System.out.println(req.getParameter("stock_code"));
		int stock_code = Integer.parseInt(req.getParameter("stock_code"));

		Price price = null;
		Asset asset = null;
		try {
			price = PurchaseDAO.selectPrice(stock_code, user.getSimulationDate());
			asset = PurchaseDAO.selectAsset(stock_code, user.getId());

		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		if (button.equals("BUY")) {
			if (price.getOpenPrice() * 100 > user.getMoney()) {
				forwardURL = "/stock/purchase/purchaseerror.jsp";
			} else {

				forwardURL = "stock/purchase/purchaseInput.jsp";
				try {
					float stockAverage = getAveragePrice(user,stock_code);
					session.setAttribute("stock_average", stockAverage);
				} catch (SQLException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				}
			}
		} else if (button.equals("SELL")) {
			if (asset == null) {
				forwardURL = "/stock/sell/sellerror.jsp";
			} else if (asset.getNumber() < 100) {
				forwardURL = "/stock/sell/sellerror.jsp";
			} else
				forwardURL = "/stock/sell/sellInput.jsp";
			//当日購入平均価格を計算?
			try {
				float stockAverage = getAveragePrice(user,stock_code);
				session.setAttribute("stock_average", stockAverage);
			} catch (SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}

		}

		if (price == null)
			forwardURL = errorURL;
		else {
			session.setAttribute("price", price);
			session.setAttribute("asset", asset);
		}

		//		req.getRequestDispatcher("/stock/purchase/purchaseInput.jsp").forward(req, resp);
		req.getRequestDispatcher(forwardURL).forward(req, resp);
	}

	public static float getAveragePrice(User user,int stockCode) throws SQLException {
		List<History> purchaseList = SellDAO.selectPurchaseHistory(user,stockCode);
		List<History> sellList = SellDAO.selectSellHistory(user,stockCode);

		//最後の購入履歴から売却数を引いていく
		int index=0;
		for (int i = 0; i < sellList.size(); i++) {
			int sellNumber = Math.abs(sellList.get(i).getNumber());
			while (sellNumber > 0 && index<purchaseList.size()) {
				History pnHistory = purchaseList.get(index);
				if (sellNumber < pnHistory.getNumber()) {
					pnHistory.setNumber(pnHistory.getNumber() - sellNumber);
					sellNumber = 0;
				} else {
					sellNumber -= pnHistory.getNumber();
					pnHistory.setNumber(0);
					index++;
				}
//				System.out.println(index+","+sellNumber);
			}

		}
		float size = 0;
		float sum = 0;

		for (History purchase : purchaseList) {
			size += purchase.getNumber();
			sum += (purchase.getClosingPrice() * purchase.getNumber());
		}
		if (size == 0)
			return 0f;
		else
			return sum / size;
	}
}
