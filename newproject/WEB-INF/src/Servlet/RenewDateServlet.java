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
	public static void main(String[] args) {
		RenewDateServlet d = new RenewDateServlet();
		Calendar c = Calendar.getInstance();
		c.setTime(Date.valueOf("2020-5-12"));
//		d.addDate(c);
		d.returnDate(c);
		System.out.println(new Date(c.getTimeInMillis()));
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ
		String forwardURL ="/showinfo";
		HttpSession session = req.getSession();

		//最終日付かどうか判定
		String alertMessage =(String)session.getAttribute("alertMessage");
		if(alertMessage!=null) {

		}


		//
		User user = (User) session.getAttribute("user");
		Calendar c = Calendar.getInstance();
		c.setTime(user.getSimulationDate());
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
		c.add(Calendar.DATE, 1);
		switch (c.get(Calendar.DAY_OF_WEEK)) {
		case Calendar.SUNDAY:
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
			addDate(c);
		}
	}
	public void returnDate(Calendar c) {
		// 土日ならさらに日付を進ませる
		c.add(Calendar.DATE, -1);
		switch (c.get(Calendar.DAY_OF_WEEK)) {
		case Calendar.SUNDAY:
			c.add(Calendar.DATE, -2);
			break;
		case Calendar.SATURDAY: // Calendar.SATURDAY:7
			c.add(Calendar.DATE, -1);
			break;
		default:
			break;
		}
		//祝日の判定
		//外部パッケージを指定
		AJD ajd = new AJD(c);
		if(Holiday.getHoliday(ajd)!=null) {
			returnDate(c);
		}
	}
}
