package dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.Asset;
import bean.Price;
import bean.Score;
import bean.User;
import database.DBManager;
import resultmapping.AssetMapping;
import resultmapping.ScoreMapping;

public class ShowResultDAO {
	public static void main(String[] args) throws SQLException {
		User user =new User();
		user.setId("admin");
		ShowResultDAO.initializeUser(user);
//		selectScore();
	}
	public static Map<Integer,Integer> selectWhereUserID(User user) throws SQLException{
		String sql="SELECT * FROM asset WHERE user_id=\'"+user.getId()+"'";
		List<Asset> assetList= DBManager.findAll(sql, new AssetMapping());

		Map<Integer,Integer> assetMap =new HashMap();
		for(Asset asset:assetList) {
			assetMap.put(asset.getStockCode(), asset.getNumber());
		}
		return assetMap;
	}
	public static long getTotalAssets(User user) throws SQLException {
		List<Price> priceList = ShowInfoDAO.selectPrice(user);
		Map<Integer,Integer> assetMap=ShowResultDAO.selectWhereUserID(user);

		long totalAsset=0;
		for(Price price:priceList) {
			int stockCode = price.getStockCode();
			if(assetMap.containsKey(stockCode)) {
				int value = price.getOpenPrice()*assetMap.get(stockCode);
				totalAsset+=value;
			}
		}
		return totalAsset;
	}

	public static boolean initializeUser(User user) throws SQLException {
		String deleteAsset ="DELETE FROM asset WHERE user_id='"+user.getId()+"'";
		String deleteHistory ="DELETE FROM history WHERE user_id='"+user.getId()+"'";
		String initializeUser ="UPDATE userinformation SET money="+User.intialMoney+", "
				+"simulation_date='"+User.intialDate+"' "
				+"WHERE user_id='"+user.getId()+"'";

		List<String> sqls = new ArrayList<String>();
		sqls.add(deleteAsset);
		sqls.add(deleteHistory);
		sqls.add(initializeUser);
		return DBManager.complexUpdate(sqls);
	}

	public static boolean insertScore(Score score) throws SQLException {
		String sql ="INSERT INTO score VALUES(\'"
				+score.getUserID()+"', \'"
				+new Date(new java.util.Date().getTime())+"',"
				+score.getTotalAsset()+")";
		System.out.println(sql);
		int result = DBManager.simpleUpdate(sql);
		if(result>0)return true;
		else return false;
	}
	public static List<Score> selectScore() throws SQLException{
		String sql="SELECT distinct user_id,total_asset,date,\n" +
				"DENSE_RANK() OVER(ORDER BY total_asset DESC) AS rank\n" +
				"FROM score T1 WHERE NOT EXISTS \n" +
				"(SELECT * FROM score T2 WHERE T1.user_id = T2.user_id AND T1.total_asset < T2.total_asset)\n" +

				"order by total_asset desc";
//	    System.out.println(sql);
		return DBManager.findAll(sql, new ScoreMapping());
	}



}
