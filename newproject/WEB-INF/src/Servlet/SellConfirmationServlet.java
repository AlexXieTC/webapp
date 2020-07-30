package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Asset;

@WebServlet("/sellConfirmation")
public class SellConfirmationServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ

		req.setCharacterEncoding("Shift-JIS");
		String pushedButton = req.getParameter("button");
		if(pushedButton!=null &&pushedButton.equals("キャンセル")) {
			req.getRequestDispatcher("/showinfo").forward(req, resp);
			return;
		}
		//ブラウザバック対策
		HttpSession session = req.getSession();
		Asset aBean = (Asset) session.getAttribute("asset");
		if(aBean==null) {
			req.getRequestDispatcher("/showinfo").forward(req, resp);
			return;
		}


		int sellNumber = Integer.parseInt(req.getParameter("sellNumber"));
		req.setAttribute("sellNumber",sellNumber);

		//		System.out.println(req.getAtt);
		//		System.out.println(stock.getStockName());

		req.getRequestDispatcher("/stock/sell/sellConfirmation.jsp").forward(req, resp);
	}
}
