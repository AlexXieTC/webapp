package Servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.News;
import bean.Price;
import bean.User;
import dao.ShowInfoDAO;
import dao.ShowResultDAO;

public class ShowInfoServlet extends HttpServlet {
	public void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String forwardURL = "/stock/stocklist.jsp";
		HttpSession session = request.getSession();
		User ubean = (User) session.getAttribute("user");

		try {
			List<News> newsList = ShowInfoDAO.selectNews(ubean);
			request.setAttribute("newsList", newsList);

			List<Price> priceList = ShowInfoDAO.selectPrice(ubean);
			request.setAttribute("priceList", priceList);

			List<Price> indexList = ShowInfoDAO.selectIndex(ubean);
			request.setAttribute("indexList", indexList);

			User user = ubean.clone();
			Calendar c = Calendar.getInstance();
			c.setTime(user.getSimulationDate());
			RenewDateServlet.returnDate(c);
			user.setSimulationDate(new Date(c.getTimeInMillis()));

			List<Price> dateList = ShowInfoDAO.selectDate(user);
			request.setAttribute("dateList", dateList);

			List<Price> idateList = ShowInfoDAO.selectIDate(user);
			request.setAttribute("idateList", idateList);

			Map<Integer, Integer> assetMap = ShowResultDAO.selectWhereUserID(ubean);
			request.setAttribute("assetMap", assetMap);

			//最終日付の確認
			Date finalDate = Date.valueOf("2020-06-29");
			if (finalDate.equals(ubean.getSimulationDate())) {
				String alertMessage = "本日が行動可能最終日です";
				session.setAttribute("alertMessage", alertMessage);
			}

			forwardURL = "/stock/stocklist.jsp";

		} catch (SQLException e) {
			e.printStackTrace();
			//			forwardURL = "";
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}

		request.getRequestDispatcher(forwardURL).forward(request, response);

	}

	public void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
