package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Asset;
import bean.User;

@WebServlet("/sell")
public class SellServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ

		String forwardURL ="/stock/error.jsp";


		//RequestScopeから更新後の情報を持つbeanを取得
		User uBean = (User)req.getAttribute("user?");
		Asset aBean = (Asset)req.getAttribute("asset");

		boolean isSuccess =false;
		try {

			isSuccess = dao.SellDAO.update(uBean, aBean);

		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		if(isSuccess) {
			forwardURL ="stock/success.jsp";

			HttpSession session = req.getSession();
			session.setAttribute("user?", uBean);

			//sell処理と使いまわすのならメッセージを追加するべき？

		}

		req.getRequestDispatcher(forwardURL).forward(req, resp);
	}

}
