package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.History;
import dao.ShowInfoDAO;

@WebServlet("/status")
public class StatusServlet {
	public void doPost(HttpServletRequest request,
	HttpServletResponse response)throws ServletException, IOException {

				request.setCharacterEncoding("Shift_JIS");
				String forwardURL=null;

				try {
					List<History> historyList=ShowInfoDAO.selectHistory();
					request.setAttribute("historyList", historyList);
					forwardURL = "/stock/user_status/status.jsp";

				}catch(NumberFormatException e) {
					e.printStackTrace();
//					forwardURL = "";
				}catch(SQLException e) {
					e.printStackTrace();
//					forwardURL = "";
				}

				request.getRequestDispatcher(forwardURL).forward(request, response);


			}
}
