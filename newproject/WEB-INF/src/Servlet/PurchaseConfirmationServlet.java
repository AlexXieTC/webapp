package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Price;

@WebServlet("/purchaseConfirmation")
public class PurchaseConfirmationServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ
		String url ="/showinfo";
		HttpSession session =req.getSession();
		Price price =(Price )session.getAttribute("price");

		//戻る対策
		if(price==null) {
			req.getRequestDispatcher(url).forward(req, resp);
			return;
		}

		String pushedButton = req.getParameter("button");
		if(pushedButton!=null &&pushedButton.equals("キャンセル")) {
			req.getRequestDispatcher(url).forward(req, resp);
			return;
		}


		int purchaseNumber = Integer.parseInt(req.getParameter("purchaseNumber"));
		req.setAttribute("purchaseNumber", purchaseNumber);

		url="/stock/purchase/purchaseConfirmation.jsp";
		req.getRequestDispatcher(url).forward(req, resp);
	}
}
