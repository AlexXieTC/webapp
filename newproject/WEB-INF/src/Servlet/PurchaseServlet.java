package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Asset;
import bean.User;

@WebServlet("/purchase")
public class PurchaseServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ

		//RequestScopeから更新後の情報を持つbeanを取得
		User uBean = (User)req.getAttribute("user?");
		Asset aBean = (Asset)req.getAttribute("asset");

		boolean isInsert = (Boolean)req.getAttribute("isInsert");

		boolean isSuccess =




	}
}
