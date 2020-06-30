package resultmapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Asset;

public class AssetMapping implements ResultSetBeanMapping<Asset>{

	@Override
	public Asset createFromResultSet(ResultSet rs) throws SQLException {
		// TODO 自動生成されたメソッド・スタブ
		Asset asset = new Asset();
		asset.setUserID(rs.getString("user_id"));
		asset.setStockCode(rs.getInt("stock_code"));
		asset.setNumber(rs.getInt("number"));
		return asset;

	}

}
