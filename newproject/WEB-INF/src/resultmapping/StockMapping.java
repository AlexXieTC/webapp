package resultmapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Stock;

public class StockMapping implements ResultSetBeanMapping<Stock>{

	@Override
	public Stock createFromResultSet(ResultSet rs) throws SQLException {
		// TODO 自動生成されたメソッド・スタブ
		Stock stock = new Stock();
		stock.setStockName(rs.getString("stock_name"));
		stock.setStockCode(rs.getInt("stock_code"));

		return stock;
	}

}
