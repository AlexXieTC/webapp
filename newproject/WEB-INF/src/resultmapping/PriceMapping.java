package resultmapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Price;

public class PriceMapping implements ResultSetBeanMapping<Price>{

	@Override
	public Price createFromResultSet(ResultSet rs) throws SQLException {
		// TODO 自動生成されたメソッド・スタブ
		Price price = new Price();
		price.setStockCode(rs.getInt("stock_code"));
		price.setDate(rs.getDate("date"));
		price.setOpenPrice(rs.getInt("open_price"));
		price.setClosingPrice(rs.getInt("closing_price"));
		price.setVolume(rs.getInt("volume"));
		return price;
	}

}
