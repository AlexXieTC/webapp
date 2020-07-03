package Servlet;

import java.io.IOException;
import java.util.Enumeration;

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

		req.setCharacterEncoding("UTF-8");
		String pushedButton = req.getParameter("button");
		if(pushedButton.equals("キャンセル")) {
			req.getRequestDispatcher("/showinfo").forward(req, resp);
			return;
		}



		Enumeration names = req.getParameterNames();

		int parchaseNumber = Integer.parseInt(req.getParameter("parchaseNumber"));
		req.setAttribute("parchaseNumber", parchaseNumber);

		//		System.out.println(req.getAtt);
		//		System.out.println(stock.getStockName());

		req.getRequestDispatcher("/stock/purchaseConfirmation.jsp").forward(req, resp);
	}
}
