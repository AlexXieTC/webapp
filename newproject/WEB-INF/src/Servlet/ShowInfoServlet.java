package Servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.News;
import bean.Price;
import bean.User;
import dao.ShowInfoDAO;


public class ShowInfoServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,
	HttpServletResponse response)throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String forwardURL="/stock/stocklist.jsp";
		HttpSession session =request.getSession();
		User ubean=(User)session.getAttribute("user");

		try {
			List<News> newsList=ShowInfoDAO.selectNews();
			request.setAttribute("newsList", newsList);

			List<Price> priceList=ShowInfoDAO.selectPrice(ubean);
			request.setAttribute("priceList", priceList);

			User user = ubean.clone();
			Calendar c = Calendar.getInstance();
			c.setTime(user.getSimulationDate());
			RenewDateServlet d = new RenewDateServlet();
			d.returnDate(c);
			user.setSimulationDate(new Date(c.getTimeInMillis()));

			List<Price> dateList=ShowInfoDAO.selectDate(ubean);
			request.setAttribute("dateList", dateList);

			forwardURL="/stock/stocklist.jsp";

		}catch(NumberFormatException e) {
			e.printStackTrace();
//			forwardURL = "";
		}catch(SQLException e) {
			e.printStackTrace();
//			forwardURL = "";
		}catch(CloneNotSupportedException e) {
			e.printStackTrace();
		}

		request.getRequestDispatcher(forwardURL).forward(request, response);


	}
	public void doPost(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException {

				request.setCharacterEncoding("Shift_JIS");
				String forwardURL=null;

				HttpSession session =request.getSession();
				User ubean=(User)session.getAttribute("user");

				try {
					List<News> newsList=ShowInfoDAO.selectNews();
					request.setAttribute("newsList", newsList);
					List<Price> priceList=ShowInfoDAO.selectPrice(ubean);
					request.setAttribute("priceList", priceList);


					User user = (User) session.getAttribute("user");
					Calendar c = Calendar.getInstance();
					c.setTime(user.getSimulationDate());
					RenewDateServlet d = new RenewDateServlet();
					d.returnDate(c);
					user.setSimulationDate(new Date(c.getTimeInMillis()));

					List<Price> dateList=ShowInfoDAO.selectDate(ubean);
					request.setAttribute("dateList", dateList);

					forwardURL = "/stock/stocklist.jsp";

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
