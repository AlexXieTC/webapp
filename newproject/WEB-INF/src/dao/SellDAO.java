package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Asset;
import bean.User;
import database.DBManager;

public class SellDAO {
	public static void main(String[] args) throws SQLException {
		User uBean= new User();
		uBean.setMoney(40000000);
		uBean.setId("admin");

		Asset aBean= new Asset();
		aBean.setUserID("admin");
		aBean.setNumber(1);
		aBean.setStockCode(9434);

		update(uBean, aBean);
	}
	public static boolean update(User uBean, Asset aBean) throws SQLException {

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


}
