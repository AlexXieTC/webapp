package database;

import java.sql.SQLException;

public class ShowInfoDAO {
	public static int selectNews()throws SQLException {
		String sql="SELECT * FROM NEWS,USERINFORMATION"
				+ " WHERE NEWS.DATE=USERINFORMATION.SIMULATION_DATE";
		return DBManager.simpleUpdate(sql);
	}
	public static int selectStock()throws SQLException {
		String sql="SELECT * FROM PRICE,USERINFORMATION"
				+ " WHERE PRICE.DATE=USERINFORMATION.SIMULATION_DATE";
		return DBManager.simpleUpdate(sql);
	}
	public static int selectUser()throws SQLException {
		String sql="SELECT * FROM USERINFORMATION";
		return DBManager.simpleUpdate(sql);
	}
}
