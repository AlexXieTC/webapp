package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import dao.SignupDAO;

//@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

	public void doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String userID = request.getParameter("userID");
		String password = request.getParameter("password");

		String forwardURL = null;

		//空文字か判定して、空文字だったらエラーページに遷移
		if (userID.equals("") || password.equals("")) {
			forwardURL = "/stock/signuperrorblank.jsp";
			request.getRequestDispatcher(forwardURL).forward(request, response);
			return;
		}

		forwardURL = "/stock/signuperror.jsp";

		try {
			User ubean = new User();
			ubean.setId(userID);
			ubean.setPassword(password);

			int insertCount = SignupDAO.insert(ubean);

			if (insertCount < 1) {
				forwardURL = "/stock/signuperror.jsp";
			} else {
				forwardURL = "/index.jsp";
			}
			System.out.println(forwardURL);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
			forwardURL = "/stock/signuperror.jsp";
		}

		request.getRequestDispatcher(forwardURL).forward(request, response);
	}
}