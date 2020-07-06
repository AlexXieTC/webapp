package test;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Asset;
import bean.Stock;
import bean.User;

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
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ

		String forwardURL=null;
		String button=req.getParameter("button");
		if(button.equals("BUY"))forwardURL= "stock/purchase/purchaseInput.jsp";
		else forwardURL = "/stock/sell/sellInput.jsp";

		HttpSession session = req.getSession();

		//暫定的にsession生成
		User user = new User();
		user.setMoney(1600000);
		user.setId("admin");
		user.setSimulationDate(Date.valueOf(s));
		java.util.Date date =new GregorianCalendar(30, 6, 1);
		session.setAttribute("user", user);

		Stock stock = new Stock();
		stock.setStockCode(7203);
		stock.setStockName("トヨタ自動車(株)");
		session.setAttribute("stock", stock);




		Asset asset = new Asset();
		asset.setNumber(500);
		asset.setStockCode(stock.getStockCode());
		asset.setUserID(user.getId());
		session.setAttribute("asset", asset);





//		req.getRequestDispatcher("/stock/purchase/purchaseInput.jsp").forward(req, resp);
		req.getRequestDispatcher("/stock/sell/sellInput.jsp").forward(req, resp);
	}
}
