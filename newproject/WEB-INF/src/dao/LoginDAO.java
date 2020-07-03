package dao;

import java.sql.SQLException;
import java.util.List;

import bean.User;
import database.DBManager;
import resultmapping.UserMapping;

public class LoginDAO {

	public static void main(String[] args) {
		User user=new User();
		user.setId("admin");
		user.setPassword("adm1");
		try {
			getLoginUser(user);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
	}

	public static List<User> getLoginUser(User ubean)throws SQLException {
		String sql="SELECT * FROM USERINFORMATION"
				+ " WHERE USER_ID="
				+"'"+ubean.getId()+"'"
				+"AND PASSWORD="
				+"'"+ubean.getPassword()+"'";
		System.out.println(sql);
		return DBManager.findAll(sql,new UserMapping());
	}




}
