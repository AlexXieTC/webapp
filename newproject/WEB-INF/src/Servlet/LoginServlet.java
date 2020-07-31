package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import dao.LoginDAO;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userID = request.getParameter("userID");
		String password = request.getParameter("pass");

		//userIDが""ならadminとしてログイン
		if (userID.equals("")) {
			userID = "admin";
			password = "adm1";
		}

		// userインスタンスを生成しつつ、コントラスタを動かす。
		User ubean = new User();
		ubean.setId(userID);
		ubean.setPassword(password);

		String forwardURL = null;
		List<User> userList = new ArrayList<User>();
		try {
			userList = LoginDAO.getLoginUser(ubean);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		//		userListに値が入っていれば、以下の動作を実行。
		if (userList.size() == 1) {
			//		未入力の場合、エラー画面に遷移させる。
			if (userID == "") {
				//テスト版につき、adminでのログイン処理を実行
				forwardURL = "/showinfo";
				//完成版については以下の処理。
				//		forwardURL="/stock/loginerror.jsp";
			} else {
				forwardURL = "/showinfo";
				ubean = userList.get(0);
				HttpSession session = request.getSession();
				session.setAttribute("user", ubean);
			}

		} else {
			forwardURL = "/stock/loginerror.jsp";
		}
//		System.out.println(userList.size());
		//	    リストuserを取得
		//	    条件分岐
		//	    if　リストの要素数が０
		//	    リストの要素数１→成功
		//	    取得したuser情報をセッションに格納　アトリビュート名sesssion
		//	    urlをforward
		request.getRequestDispatcher(forwardURL).forward(request, response);

	}
}