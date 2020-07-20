package resultmapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Score;

public class ScoreMapping implements ResultSetBeanMapping<Score>{

	@Override
	public Score createFromResultSet(ResultSet rs) throws SQLException {
		// TODO 自動生成されたメソッド・スタブ
		Score score = new Score();

		score.setUserID(rs.getString("user_id"));
		score.setDate(rs.getDate("date"));
		score.setTotalAsset(rs.getLong("total_asset"));
		score.setRank(rs.getInt("rank"));

		return score;
	}

}
