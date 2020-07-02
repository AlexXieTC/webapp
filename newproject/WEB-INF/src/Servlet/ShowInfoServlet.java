package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.News;
import bean.Price;
import dao.ShowInfoDAO;


public class ShowInfoServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,
	HttpServletResponse response)throws ServletException, IOException {

		request.setCharacterEncoding("Shift_JIS");
		String forwardURL=null;

		try {
			List<News> newsList=ShowInfoDAO.selectNews();
			request.setAttribute("newsList", newsList);
			List<Price> priceList=ShowInfoDAO.selectPrice();
			request.setAttribute("priceList", priceList);
			forwardURL = "/stock/stocklist.jsp";

		}catch(NumberFormatException e) {
			e.printStackTrace();
//			forwardURL = "";
		}catch(SQLException e) {
			e.printStackTrace();
//			forwardURL = "";
		}

		request.getRequestDispatcher(forwardURL).forward(request, response);


	}
}
