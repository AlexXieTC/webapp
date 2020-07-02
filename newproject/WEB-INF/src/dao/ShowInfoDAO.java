package dao;

import java.sql.SQLException;
import java.util.List;

import bean.News;
import bean.Price;
import bean.Stock;
import bean.User;
import database.DBManager;
import resultmapping.NewsMapping;
import resultmapping.PriceMapping;
import resultmapping.StockMapping;
import resultmapping.UserMapping;

public class ShowInfoDAO {
	public static List<News> selectNews()throws SQLException {
		String sql="SELECT * FROM NEWS,USERINFORMATION"
				+ " WHERE NEWS.DATE=USERINFORMATION.SIMULATION_DATE";
		return DBManager.findAll(sql, new NewsMapping());
	}
	public static List<Price> selectPrice()throws SQLException {
		String sql="SELECT * FROM PRICE,USERINFORMATION,STOCK"
				+ " WHERE PRICE.DATE=USERINFORMATION.SIMULATION_DATE"
				+" AND PRICE.STOCK_CODE=STOCK.STOCK_CODE";
		return DBManager.findAll(sql, new PriceMapping());
	}
	public static List<User> selectUser()throws SQLException {
		String sql="SELECT * FROM USERINFORMATION";
		return DBManager.findAll(sql, new UserMapping());
	}
	public static List<Stock> selectStock()throws SQLException {
		String sql="SELECT * FROM STOCK";
		return DBManager.findAll(sql, new StockMapping());
	}
}
