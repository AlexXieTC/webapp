package test;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Asset;
import bean.Price;
import bean.Stock;
import bean.User;

@WebServlet("/test")
public class testServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ

		HttpSession session = req.getSession();


		Stock stock = new Stock();
		stock.setStockCode(7203);
		stock.setStockName("トヨタ自動車(株)");
		session.setAttribute("stock", stock);

		Price price = new Price();
		price.setOpenPrice(1000);
		price.setClosingPrice(2000);
		price.setVolume(10000);
		price.setDate(new Date(2020,6,2));
		session.setAttribute("price", price);

		User user = new User();
		user.setMoney(1600000);
		user.setId("admin");
		session.setAttribute("user", user);

		Asset asset = new Asset();
		asset.setNumber(500);
		asset.setStockCode(stock.getStockCode());
		asset.setUserID(user.getId());
		session.setAttribute("asset", asset);





		req.getRequestDispatcher("/stock/sellInput.jsp").forward(req, resp);
	}
}
