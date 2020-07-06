package test;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Asset;
import bean.Price;
import bean.User;
import dao.PurchaseDAO;

//買い注文、売り注文であるか判別し、適切なページにフォワーディング
//銘柄にまつわる情報をsessionに格納

@WebServlet("/buysellaction")
public class testServlet extends HttpServlet {
	public static void main(String[] args) {
		//暫定的にsession生成
		User user = new User();
		user.setMoney(1600000);
		user.setId("admin");
		user.setSimulationDate(Date.valueOf("2020-6-1"));
//		session.setAttribute("user", user);
		System.out.println(user.getSimulationDate());
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ
		doPost(req, resp);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ
		req.setCharacterEncoding("UTF-8");

		String forwardURL=null;
		String errorURL="error";
		String button=req.getParameter("button");
		System.out.println(button);
		if(button.equals("BUY"))forwardURL= "stock/purchase/purchaseInput.jsp";
		else forwardURL = "/stock/sell/sellInput.jsp";

		HttpSession session = req.getSession();

		//暫定的にsession生成
		User user = new User();
		user.setMoney(1600000);
		user.setId("admin");
		user.setSimulationDate(Date.valueOf("2020-6-1"));
		session.setAttribute("user", user);

		System.out.println(req.getParameter("stock_code"));
		int stock_code = Integer.parseInt(req.getParameter("stock_code"));

		Price price=null;
		Asset asset = null;
		try {
			price = PurchaseDAO.selectPrice(stock_code, user.getSimulationDate());
			asset = PurchaseDAO.selectAsset(stock_code, user.getId());

		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		System.out.println(price);
		if(price ==null)forwardURL =errorURL;
		else {
			session.setAttribute("price", price);
			session.setAttribute("asset", asset);
		}

//		req.getRequestDispatcher("/stock/purchase/purchaseInput.jsp").forward(req, resp);
		req.getRequestDispatcher(forwardURL).forward(req, resp);
	}
}
