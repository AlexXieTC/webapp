package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.History;
import bean.Score;
import bean.User;
import dao.ShowInfoDAO;
import dao.ShowResultDAO;

public class StatusServlet extends HttpServlet{

	public void doPost(HttpServletRequest request,
	HttpServletResponse response)throws ServletException, IOException {

				request.setCharacterEncoding("Shift_JIS");
				String forwardURL=null;
				HttpSession session =request.getSession();
				User ubean=(User)session.getAttribute("user");

				try {
					List<History> historyList=ShowInfoDAO.selectHistory(ubean);
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
	public void doGet(HttpServletRequest request,
	HttpServletResponse response)throws ServletException, IOException {

				request.setCharacterEncoding("Shift_JIS");
				String forwardURL=null;
				HttpSession session =request.getSession();
				User ubean=(User)session.getAttribute("user");

				try {
					List<History> historyList=ShowInfoDAO.selectHistory(ubean);
					request.setAttribute("historyList", historyList);

					long stockAsset = ShowResultDAO.getTotalAssets(ubean);
					request.setAttribute("stockAsset", stockAsset);
					Score score = new Score();
					score.setTotalAsset(stockAsset);

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
