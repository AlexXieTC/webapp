package dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Asset;
import bean.Price;
import bean.User;
import database.DBManager;
import resultmapping.AssetMapping;
import resultmapping.PriceMapping;

public class PurchaseDAO {
	public static void main(String[] args) throws SQLException {
//		User uBean= new User();
//		uBean.setMoney(40000000);
//		uBean.setId("admin");
//
//		Asset aBean= new Asset();
//		aBean.setUserID("admin");
//		aBean.setNumber(50000);
//		aBean.setStockCode(9434);
//
//		update(uBean, aBean);
		User user = new User();
		user.setMoney(1600000);
		user.setId("admin");
		user.setSimulationDate(Date.valueOf("2020-6-1"));
		int stock_code=7203;

		Price p =selectPrice(stock_code, user.getSimulationDate());
		System.out.println(p.getStockCode());
	}
	public static boolean update(User uBean, Asset aBean,String stockName,int number) throws SQLException {

		String updateUser = "UPDATE userinformation SET money ="
				+ uBean.getMoney()+" WHERE user_id = \'"
				+uBean.getId()+"'";
		String updateAsset ="UPDATE asset SET number ="
				+aBean.getNumber()+" WHERE user_id=\'"+aBean.getUserID()
				+"' AND stock_code = "+aBean.getStockCode();

		String insertHistory="INSERT INTO history "
				+"Values(\'"+uBean.getSimulationDate()+"', "
				+"'"+uBean.getId()+"', "
				+aBean.getStockCode()+", "
				+"'"+stockName+"', "
				+number+")";

		List<String> sqls = new ArrayList<String>();
		sqls.add(updateAsset);
		sqls.add(updateUser);
		sqls.add(insertHistory);
		return DBManager.complexUpdate(sqls);
	}

	public static boolean insert(User uBean, Asset aBean,String stockName,int number) throws SQLException {

		String updateUser = "UPDATE userinformation SET money ="
				+ uBean.getMoney()+" WHERE user_id = \'"
				+uBean.getId()+"'";
		String insertAsset ="INSERT INTO asset(user_id,stock_code,number) VALUES(\'"+
				aBean.getUserID()+"\', "+aBean.getStockCode()+", "
				+aBean.getNumber()+")";

		String insertHistory="INSERT INTO history "
				+"Values(\'"+uBean.getSimulationDate()+"', "
				+"'"+uBean.getId()+"', "
				+aBean.getStockCode()+", "
				+"'"+stockName+"', "
				+number+")";

		List<String> sqls = new ArrayList<String>();
		sqls.add(insertAsset);
		sqls.add(updateUser);
		sqls.add(insertHistory);
		return DBManager.complexUpdate(sqls);
	}

	public static Price selectPrice(int stock_code ,Date date) throws SQLException {

		String selectPrice = "SELECT * FROM stock,price"
				+ " WHERE price.date =\'"+date+"'"
				+" AND price.stock_code = stock.stock_code"
				+ " AND stock.stock_code="+stock_code;
				System.out.println(selectPrice);


		List<Price> priceList = DBManager.findAll(selectPrice,new PriceMapping());
		System.out.println(priceList.size());
		if(priceList ==null  || priceList.size()==0)return null;
		else return priceList.get(0);
	}

	public static Asset selectAsset(int stock_code,String userID) throws SQLException {
		String selectAsset ="SELECT * FROM asset "
				+"WHERE user_id = \'"+userID+"'"
				+" AND stock_code ="+stock_code;
		System.out.println(selectAsset);
		List<Asset> assetList =DBManager.findAll(selectAsset, new AssetMapping());
		if(assetList == null || assetList.size()==0)return null;
		else return assetList.get(0);
	}
}
