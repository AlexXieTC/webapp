package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Asset;
import bean.History;
import bean.User;
import database.DBManager;
import resultmapping.HistoryMapping;

public class SellDAO {
	public static void main(String[] args) throws SQLException {
		User uBean = new User();
		uBean.setMoney(40000000);
		uBean.setId("admin");

		int stockCode =2503;
		List<History> h =selectSellHistory(uBean, stockCode);
		System.out.println(h.size());
	}

	public static boolean update(User uBean, Asset aBean) throws SQLException {

		String updateUser = "UPDATE userinformation SET money ="
				+ uBean.getMoney() + " WHERE user_id = \'"
				+ uBean.getId() + "'";
		String updateAsset = "UPDATE asset SET number ="
				+ aBean.getNumber() + " WHERE user_id=\'" + aBean.getUserID()
				+ "' AND stock_code = " + aBean.getStockCode();

		List<String> sqls = new ArrayList<String>();
		sqls.add(updateAsset);
		sqls.add(updateUser);
		return DBManager.complexUpdate(sqls);
	}

	public static List<History> selectSellHistory(User ubean, int stockCode) throws SQLException {
		String sql = "SELECT * FROM HISTORY,PRICE,USERINFORMATION"
				+ " WHERE HISTORY.DATE=PRICE.DATE "
				+ " AND HISTORY.STOCK_CODE=PRICE.STOCK_CODE"
				+ " AND userinformation.user_id='" + ubean.getId() + "'"
				+ " AND HISTORY.USER_ID='" + ubean.getId() + "'"
				+ " AND history.stock_code=" + stockCode
				+ " AND history.number <0"
				+ " ORDER BY HISTORY.DATE";
		return DBManager.findAll(sql, new HistoryMapping());
	}

	public static List<History> selectPurchaseHistory(User ubean,int stockCode) throws SQLException {
		String sql = "SELECT * FROM HISTORY,PRICE,USERINFORMATION"
				+ " WHERE HISTORY.DATE=PRICE.DATE "
				+ " AND HISTORY.STOCK_CODE=PRICE.STOCK_CODE"
				+ " AND USERINFORMATION.USER_ID='" + ubean.getId() + "'"
				+ " AND HISTORY.USER_ID='" + ubean.getId() + "'"
				+ " AND history.stock_code=" + stockCode
				+ " AND history.number >0"
				+ " ORDER BY HISTORY.DATE ";
		return DBManager.findAll(sql, new HistoryMapping());
	}

}
