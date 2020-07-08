package dao;

import java.sql.Date;
import java.sql.SQLException;

import bean.User;
import database.DBManager;

public class RenewDateDAO {
	public static void main(String[] args) throws SQLException {
		User user= new User();
		user.setId("admin");
		user.setSimulationDate(Date.valueOf("2020-6-1"));
		update(user);
	}

	public static boolean update(User user) throws SQLException {
		String sql ="UPDATE userinformation SET "
				+"simulation_date = \'"+user.getSimulationDate()+"' "
				+"WHERE user_id =\'"+user.getId()+"'";
		System.out.println(sql);
		int result = DBManager.simpleUpdate(sql);
		if(result>0)return true;
		else return false;
	}
}
