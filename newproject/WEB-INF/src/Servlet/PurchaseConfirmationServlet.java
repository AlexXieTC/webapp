package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/purchaseConfirmation")
public class PurchaseConfirmationServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ


		String pushedButton = req.getParameter("button");
		if(pushedButton!=null &&pushedButton.equals("キャンセル")) {
			req.getRequestDispatcher("/showinfo").forward(req, resp);
			return;
		}


		int purchaseNumber = Integer.parseInt(req.getParameter("purchaseNumber"));
		req.setAttribute("purchaseNumber", purchaseNumber);

		//		System.out.println(req.getAtt);
		//		System.out.println(stock.getStockName());

		req.getRequestDispatcher("/stock/purchase/purchaseConfirmation.jsp").forward(req, resp);
	}
}
