package dao;

import java.sql.SQLException;

import bean.User;
import database.DBManager;

public class SignupDAO {
	public static void main(String[] args) throws SQLException {
		User user = new User();
		user.setId("ad");
		user.setPassword("adm1");
		System.out.println(insert(user));
	}
	public static int insert(User user) throws SQLException{

//		String sql= "INSERT INTO userinformation"+"(user_id,password,money,simulation_date)
//						VALUES("+"'"+user.getId() +"',"+"'"+ user.getPassword()+"',"+ 1000000,"'"+2020/06/01"'"+)";

		String sql="INSERT INTO userinformation" +"(user_id,password,money,simulation_date) VALUES(" +
			"'"+user.getId()+"',"+"'"+user.getPassword()+"',"
				+User.intialMoney+", '"+User.intialDate+"')";

		return DBManager.simpleUpdate(sql);
	}
}
