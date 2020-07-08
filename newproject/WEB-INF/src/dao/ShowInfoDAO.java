package dao;

import java.sql.SQLException;
import java.util.List;

import bean.History;
import bean.News;
import bean.Price;
import bean.Stock;
import bean.User;
import database.DBManager;
import resultmapping.HistoryMapping;
import resultmapping.NewsMapping;
import resultmapping.PriceMapping;
import resultmapping.StockMapping;
import resultmapping.UserMapping;


public class ShowInfoDAO {

	User ubean= new User();

	public static void main(String[] args) {
		String sql="SELECT * FROM PRICE,USERINFORMATION,STOCK"
				+ " WHERE PRICE.DATE=USERINFORMATION.SIMULATION_DATE"
				+" AND PRICE.STOCK_CODE=STOCK.STOCK_CODE";
	}
	public static List<News> selectNews()throws SQLException {
		String sql="SELECT * FROM NEWS,USERINFORMATION"
				+ " WHERE NEWS.DATE=USERINFORMATION.SIMULATION_DATE";
		return DBManager.findAll(sql, new NewsMapping());
	}
	public static List<Price> selectPrice(User ubean)throws SQLException {
		String sql="SELECT * FROM PRICE,USERINFORMATION,STOCK"
				+ " WHERE PRICE.DATE=USERINFORMATION.SIMULATION_DATE"
				+" AND PRICE.STOCK_CODE=STOCK.STOCK_CODE"
				+" AND STOCK.STOCK_CODE<9999"
				+" AND USERINFORMATION.USER_ID='"+ubean.getId()+"'"
				;
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
	public static List<History> selectHistory(User ubean)throws SQLException {
		String sql="SELECT * FROM HISTORY,PRICE,USERINFORMATION"
				+" WHERE HISTORY.DATE=PRICE.DATE "
				+" AND HISTORY.STOCK_CODE=PRICE.STOCK_CODE"
				+ " AND USERINFORMATION.USER_ID='"+ubean.getId()+"'"
				+ " AND HISTORY.USER_ID='"+ubean.getId()+"'"
				;
		return DBManager.findAll(sql, new HistoryMapping());
	}
	public static List<Price> selectDate(User ubean)throws SQLException {
		String sql="SELECT * FROM PRICE,USERINFORMATION,STOCK"
				+ " WHERE PRICE.DATE='"+ubean.getSimulationDate()+"'"
				+" AND USERINFORMATION.USER_ID='"+ubean.getId()+"'"
				+" AND STOCK.STOCK_CODE<9999"
				+" AND PRICE.STOCK_CODE=STOCK.STOCK_CODE"
				;
		System.out.println(sql);
		return DBManager.findAll(sql,new PriceMapping());
	}
}
