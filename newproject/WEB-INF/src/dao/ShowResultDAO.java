package dao;

import java.sql.Date;
import java.sql.SQLException;
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
		return totalAsset+user.getMoney();

	}
	public static long getStockAssets(User user) throws SQLException {
		List<Price> priceList = ShowInfoDAO.selectPrice(user);
		Map<Integer,Integer> assetMap=ShowResultDAO.selectWhereUserID(user);

		long stockAsset=0;
		for(Price price:priceList) {
			int stockCode = price.getStockCode();
			if(assetMap.containsKey(stockCode)) {
				int value = price.getOpenPrice()*assetMap.get(stockCode);
				stockAsset+=value;
			}
		}
		return stockAsset;

	}

	public static boolean insertScore(Score score) throws SQLException {
		String sql ="INSERT INTO score VALUES(\'"
				+score.getUserID()+"', \'"
				+new Date(new java.util.Date().getTime())+"',"
				+score.getTotalAsset()+")";
		int result = DBManager.simpleUpdate(sql);
		if(result>0)return true;
		else return false;
	}
	public static List<Score> selectScore() throws SQLException{
		String sql="SELECT * FROM score ORDER BY total_asset DESC";
		return DBManager.findAll(sql, new ScoreMapping());
	}

	public static int getRank(Score score) throws SQLException {
		List<Score> scoreList = selectScore();
		int rank =0;
		for(int i=0;i<scoreList.size();i++) {
			Score s = scoreList.get(i);
			boolean sameAsset= s.getTotalAsset() == score.getTotalAsset();
			boolean sameUser = s.getUserID().equals(score.getUserID());
			if(sameAsset && sameUser) {
				rank =i;
				break;
			}
		}
		return rank;
	}

}
