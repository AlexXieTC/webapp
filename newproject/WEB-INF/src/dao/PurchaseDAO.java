package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Asset;
import bean.User;
import database.DBManager;

public class PurchaseDAO {
	public static void main(String[] args) throws SQLException {
		User uBean= new User();
		uBean.setMoney(40000000);
		uBean.setId("admin");

		Asset aBean= new Asset();
		aBean.setUserID("admin");
		aBean.setNumber(50000);
		aBean.setStockCode(9434);

		update(uBean, aBean);
	}
	public static int update(User uBean, Asset aBean) throws SQLException {

		String updateUser = "UPDATE userinformation SET money ="
				+ uBean.getMoney()+" WHERE user_id = \'"
				+uBean.getId()+"'";
		String updateAsset ="UPDATE asset SET number ="
				+aBean.getNumber()+" WHERE user_id=\'"+aBean.getUserID()
				+"' AND stock_code = "+aBean.getStockCode();

		List<String> sqls = new ArrayList<String>();
		sqls.add(updateAsset);
		sqls.add(updateUser);
		return DBManager.complexUpdate(sqls);
	}

	public static int insert(User uBean, Asset aBean) throws SQLException {

		String updateUser = "UPDATE userinformation SET money ="
				+ uBean.getMoney()+" WHERE user_id = \'"
				+uBean.getId()+"'";
		String insertAsset ="INSERT INTO asset(user_id,stock_code,number) VALUES(\'"+
				aBean.getUserID()+"\', "+aBean.getStockCode()+", "
				+aBean.getNumber()+")";

		List<String> sqls = new ArrayList<String>();
		sqls.add(insertAsset);
		sqls.add(updateUser);
		return DBManager.complexUpdate(sqls);
	}
}
