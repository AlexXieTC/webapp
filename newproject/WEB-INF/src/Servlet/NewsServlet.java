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

public class NewsServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String forwardURL = null;

		HttpSession session = request.getSession();
		User ubean = (User) session.getAttribute("user");

		try {
			List<News> newsList = ShowInfoDAO.selectNews(ubean);
			request.setAttribute("newsList", newsList);
			forwardURL = "/stock/news/news.jsp";

		} catch (SQLException e) {
			e.printStackTrace();
			forwardURL="/showinfo";
		}

		request.getRequestDispatcher(forwardURL).forward(request, response);

	}

}
