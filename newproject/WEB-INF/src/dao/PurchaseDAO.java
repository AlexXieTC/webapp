package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Asset;
import bean.User;
import database.DBManager;

public class PurchaseDAO {
	public static void main(String[] args) throws SQLException {
		User user= new User();
		user.setMoney(10000000);
		user.setId("admin");

		Asset asset= new Asset();
		asset.setUserID("admin");
		asset.setNumber(100);
		asset.setStockCode(7203);

		update(user, asset);
	}
	public static int update(User user, Asset asset) throws SQLException {

		String updateUser = "UPDATE userinformation SET money ="
				+ user.getMoney()+" WHERE user_id = \'"
				+user.getId()+"'";
		String updateAsset ="UPDATE asset SET number ="
				+asset.getNumber()+" WHERE user_id=\'"+asset.getUserID()
				+"' AND stock_code = "+asset.getStockCode();

		List<String> sqls = new ArrayList<String>();
		sqls.add(updateAsset);
		sqls.add(updateUser);
		for(String sql:sqls)System.out.println(sql);
		return DBManager.simpleUpdate(updateAsset);
	}
}
