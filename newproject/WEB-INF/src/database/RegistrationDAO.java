package database;

import java.sql.SQLException;

import bean.User;

public class RegistrationDAO {
	public static int insertUser(User ubean)throws SQLException{
		String sql="INSERT INTO USERINFORMATION"+
		"(USER_ID,PASSWORD,MONEY,SIMULATION_DATE) VALUES("+
		"'"+ubean.getId()+"'"+
		"'"+ubean.getPassword()+"'"+
		ubean.getMoney()+
		ubean.getSimulationDate()    //date型データを''囲む必要があるか？確認なし
		+")";
		return DBManager.simpleUpdate(sql);
	}
}
