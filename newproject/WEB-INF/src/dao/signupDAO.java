package dao;

import java.sql.SQLException;

import bean.User;
import database.DBManager;

public class signupDAO {
	public static void main(String[] args) throws SQLException {
		User user = new User();
		user.setId("admin");
		user.setPassword("adm1");
		insert(user);
	}
	public static int insert(User user) throws SQLException{

//		String sql= "INSERT INTO userinformation"+"(user_id,password,money,simulation_date)
//						VALUES("+"'"+user.getId() +"',"+"'"+ user.getPassword()+"',"+ 1000000,"'"+2020/06/01"'"+)";

		String sql="INSERT INTO userinformation" +"(user_id,password,money,simulation_date) VALUES(" +
			"'"+user.getId()+"',"+"'"+user.getPassword()+"',1000000,'2020/06/01')";

		System.out.println(sql);
		return DBManager.simpleUpdate(sql);
	}
}
