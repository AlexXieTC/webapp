package dao;

import java.sql.SQLException;

import bean.User;
import database.DBManager;

public class LoginDAO {

	public static int checkUser(User ubean)throws SQLException {
		String sql="SELECT * FROM USERINFORMATION"
				+ " WHERE USER_ID="
				+"'"+ubean.getId()+"'"
				+"AND PASSWORD="
				+"'"+ubean.getPassword()+"'";
		return DBManager.simpleUpdate(sql);
	}
}
