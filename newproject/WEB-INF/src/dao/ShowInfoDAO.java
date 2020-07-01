package dao;

import java.sql.SQLException;
import java.util.List;

import bean.News;
import bean.Stock;
import bean.User;
import database.DBManager;
import resultmapping.NewsMapping;
import resultmapping.StockMapping;
import resultmapping.UserMapping;

public class ShowInfoDAO {
	public static List<News> selectNews()throws SQLException {
		String sql="SELECT * FROM NEWS,USERINFORMATION"
				+ " WHERE NEWS.DATE=USERINFORMATION.SIMULATION_DATE";
		return DBManager.findAll(sql, new NewsMapping());
	}
	public static List<Stock> selectStock()throws SQLException {
		String sql="SELECT * FROM PRICE,USERINFORMATION"
				+ " WHERE PRICE.DATE=USERINFORMATION.SIMULATION_DATE";
		return DBManager.findAll(sql, new StockMapping());
	}
	public static List<User> selectUser()throws SQLException {
		String sql="SELECT * FROM USERINFORMATION";
		return DBManager.findAll(sql, new UserMapping());
	}
}
