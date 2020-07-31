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
		String url = "/stock/result/showResult.jsp";
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		//
		try {
			long totalAsset = ShowResultDAO.getTotalAssets(user) + user.getMoney();
			req.setAttribute("totalAsset", totalAsset);

			Score score = new Score();
			score.setUserID(user.getId());
			score.setTotalAsset(totalAsset);

			boolean insert = ShowResultDAO.insertScore(score);
			if (insert) {

				List<Score> scoreList = ShowResultDAO.selectScore();
				req.setAttribute("scoreList", scoreList);

				String resultScore = getResultRank(scoreList, score);
				req.setAttribute("result_score", resultScore);

				ShowResultDAO.initializeUser(user);
				session.invalidate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		req.getRequestDispatcher(url).forward(req, resp);
	}

	//暫定的ランキングページで使用
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ

		String url = "/stock/result/showResult.jsp";
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		//
		try {
			long totalAsset = ShowResultDAO.getTotalAssets(user);
			req.setAttribute("totalAsset", totalAsset);

			Score score = new Score();
			score.setUserID(user.getId());
			score.setTotalAsset(totalAsset + user.getMoney());
			req.setAttribute("totalAsset", score.getTotalAsset());

			List<Score> scoreList = ShowResultDAO.selectScore();
			req.setAttribute("scoreList", scoreList);

			int predictRank = getPredictRank(scoreList, score);
			req.setAttribute("predict_rank", predictRank);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher(url).forward(req, resp);
	}

	//自分のランキングがどの位置付近か総資産を見ていくメソッド
	public static int getPredictRank(List<Score> scoreList, Score tempScore) {
		int rank = 1;
		for (int i = 0; i < scoreList.size(); i++) {
			Score s = scoreList.get(i);
			boolean isBigger = (s.getTotalAsset() <= tempScore.getTotalAsset());
			if (isBigger) {
				rank = s.getRank();
				break;
			}
			rank++;
		}
		return rank;
	}

	public static String getResultRank(List<Score> scoreList, Score resultScore) {
		String message = "";
		for (int i = 0; i < scoreList.size(); i++) {
			Score score = scoreList.get(i);
			if (score.getUserID().equals(resultScore.getUserID())) {
				if (score.getTotalAsset() == resultScore.getTotalAsset())
					message = score.getRank() + "位";
				else
					message = "前回の結果(" + score.getRank() + "位)を上回ることが出来ませんでした";
				break;
			}
		}
		return message;
	}
}
