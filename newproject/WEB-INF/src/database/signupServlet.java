package database;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import dao.SignupDAO;

@WebServlet("/signup")
public class signupServlet extends HttpServlet{

	public void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException,IOException{

		request.setCharacterEncoding("Shift_JIS");

		String userID=request.getParameter("userID");
		String password=request.getParameter("password");
//		String money=request.getParameter("money");
//		String simulationDate=request.getParameter("simulationDate");

		String forwardURL=null;
		try {
			User ubean=new User();
			ubean.setId(userID);
			ubean.setPassword(password);
			int updateCount=SignupDAO.insert(ubean);

			if (updateCount < 1) {
				forwardURL="/stock/signuperror.jsp";
			}else {
				forwardURL="/stock/stocklist.jsp";
			}
		}catch(NumberFormatException e) {
			e.printStackTrace();
			forwardURL="/stock/signuperror.jsp";
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		request.getRequestDispatcher(forwardURL).forward(request,response);
	}
}