package resultmapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Ranking;

public class RankingMap implements ResultSetBeanMapping<Ranking>{

	@Override
	public Ranking createFromResultSet(ResultSet rs) throws SQLException {
		// TODO 自動生成されたメソッド・スタブ
		Ranking rank = new Ranking();
		rank.setUserID(rs.getString("user_id"));
		rank.setMoney(rs.getInt("money"));
		rank.setDate(rs.getDate("date"));
		return rank;
	}

}
