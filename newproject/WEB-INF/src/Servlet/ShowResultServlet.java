package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Score;
import bean.User;
import dao.ShowResultDAO;

@WebServlet("/showresult")
public class ShowResultServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ
		//AssetListを取得する
		//PriceListを取得
		String url ="/stock/result/showResult.jsp";
		HttpSession session = req.getSession();
		User user=(User)session.getAttribute("user");

		//
		try {
			long totalAsset = ShowResultDAO.getTotalAssets(user);
				req.setAttribute("totalAsset", totalAsset);
				Score score = new Score();
				score.setUserID(user.getId());
				score.setTotalAsset(totalAsset+user.getMoney());

				boolean insert= ShowResultDAO.insertScore(score);
				if(insert) {
					int rank = ShowResultDAO.getRank(score);
					req.setAttribute("rank", rank);
					List<Score> scoreList=ShowResultDAO.selectScore();
					req.setAttribute("scoreList", scoreList);
					ShowResultDAO.initializeUser(user);
				}


		}catch(SQLException e) {
			e.printStackTrace();
		}

		req.getRequestDispatcher(url).forward(req, resp);
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ
		//AssetListを取得する
		//PriceListを取得
		String url ="/stock/result/showResult.jsp";
		HttpSession session = req.getSession();
		User user=(User)session.getAttribute("user");



		//
		try {
			long totalAsset = ShowResultDAO.getTotalAssets(user);
				req.setAttribute("totalAsset", totalAsset);
				Score score = new Score();
				score.setUserID(user.getId());
				score.setTotalAsset(totalAsset);

				List<Score> scoreList=ShowResultDAO.selectScore();
				req.setAttribute("scoreList", scoreList);


//				boolean insert= ShowResultDAO.insertScore(score);
//				if(insert) {
//					int rank = ShowResultDAO.getRank(score);
//					req.setAttribute("rank", rank);
//				}



		}catch(SQLException e) {
			e.printStackTrace();
		}

		req.getRequestDispatcher(url).forward(req, resp);
	}
}
