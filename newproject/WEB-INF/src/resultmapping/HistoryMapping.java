package resultmapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import bean.History;

public class HistoryMapping implements ResultSetBeanMapping<History>{

	@Override
	public History createFromResultSet(ResultSet rs) throws SQLException {
		// TODO 自動生成されたメソッド・スタブ
		History history = new History();
		history.setStockName(rs.getString("stock_name"));
		history.setStockCode(rs.getInt("stock_code"));
		history.setSimulationDate(rs.getDate("date"));
		history.setId(rs.getString("user_id"));
		history.setNumber(rs.getInt("number"));
		history.setClosingPrice(rs.getInt("open_price"));
		history.setMoney(rs.getInt("money"));

		return history;
	}
}
