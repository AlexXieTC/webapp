package Servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ajd4jp.AJD;
import ajd4jp.Holiday;
import bean.User;
import dao.RenewDateDAO;

@WebServlet("/renewdate")
public class RenewDateServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ
		String forwardURL ="/showinfo";
		HttpSession session = req.getSession();

		//
		User user = (User) session.getAttribute("user");
		Calendar c = Calendar.getInstance();
		c.setTime(user.getSimulationDate());
		c.add(Calendar.DATE, 1);
		this.addDate(c);
		user.setSimulationDate(new Date(c.getTimeInMillis()));

		boolean isUpdate =false;
		try {
			isUpdate = RenewDateDAO.update(user);

		}catch(SQLException e) {
			e.printStackTrace();
		}
		if(!isUpdate)forwardURL=null;
		req.getRequestDispatcher(forwardURL).forward(req, resp);
	}

	public void addDate(Calendar c) {
		// 土日ならさらに日付を進ませる
		System.out.println("test");
		switch (c.get(Calendar.DAY_OF_WEEK)) {
		case Calendar.SUNDAY: // Calendar.SUNDAY:1 （値。意味はない）
			c.add(Calendar.DATE, 1);
			break;
		case Calendar.SATURDAY: // Calendar.SATURDAY:7
			c.add(Calendar.DATE, 2);
			break;
		default:
			break;
		}
		//祝日の判定
		//外部パッケージを指定
		AJD ajd = new AJD(c);

		if(Holiday.getHoliday(ajd)!=null) {
			c.add(Calendar.DATE, 1);
			addDate(c);
		}
	}
}