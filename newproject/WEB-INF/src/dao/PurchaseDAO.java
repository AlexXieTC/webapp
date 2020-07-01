package dao;

import bean.Asset;
import bean.User;

public class PurchaseDAO {
	public static int update(User user, Asset asset) {

		String updateUser = "UPDATE userinformation SET money ="
				+ user.getMoney()+"WHERE user_id = \'"
				+user.getId()+"'";
		String updateAsset ="UPDATE asset SET number ="
				+asset.getNumber()+"WHERE user_id=\'"+asset.getUserID()
				+"' AND stock_code = "+asset.getStockCode();

//		List<String>

		return 0;
	}
}
