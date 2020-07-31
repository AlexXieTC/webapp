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
			HttpServletResponse response) throws ServletException, IOException {

		String forwardURL = null;

		HttpSession session = request.getSession();
		User ubean = (User) session.getAttribute("user");

		String numberInput = request.getParameter("news_number");
		String newsImage = request.getParameter("news_image");

		if (numberInput == null || newsImage == null) {
			response.sendRedirect(request.getContextPath() + "/showinfo");
			return;
		} else {
			int newsNumber = Integer.parseInt(numberInput);
			request.setAttribute("news_number", newsNumber);
			request.setAttribute("news_image", newsImage);
		}

		try {
			List<News> newsList = ShowInfoDAO.selectNews(ubean);
			request.setAttribute("newsList", newsList);

			forwardURL = "/stock/news/article.jsp";

		} catch (SQLException e) {
			e.printStackTrace();
			forwardURL = "/showinfo";
		}

		request.getRequestDispatcher(forwardURL).forward(request, response);
	}

	public void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doPost(request, response);
	}

}
