package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.News;
import bean.User;
import dao.ShowInfoDAO;

public class NewsTextServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException {
				request.setCharacterEncoding("Shift_JIS");
				System.out.println("doPostの実行");
				String forwardURL=null;

				HttpSession session =request.getSession();
				User ubean=(User)session.getAttribute("user");

				int newsNumber = Integer.parseInt(request.getParameter("news_number"));
				request.setAttribute("news_number", newsNumber);
				try {
					List<News> newsList=ShowInfoDAO.selectNews(ubean);
					request.setAttribute("newsList", newsList);

					forwardURL = "/stock/news/article.jsp";

				}catch(NumberFormatException e) {
					e.printStackTrace();
					forwardURL = "/showinfo";
				}catch(SQLException e) {
					e.printStackTrace();
					forwardURL = "/showinfo";
				}

				request.getRequestDispatcher(forwardURL).forward(request, response);


					}
			public void doGet(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException {
				System.out.println("doGet");
				request.setCharacterEncoding("Shift_JIS");
				String forwardURL=null;

				HttpSession session =request.getSession();
				User ubean=(User)session.getAttribute("user");

				try {
					List<News> newsList=ShowInfoDAO.selectNews(ubean);
					request.setAttribute("newsList", newsList);
					forwardURL = "/stock/news/article.jsp";

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
