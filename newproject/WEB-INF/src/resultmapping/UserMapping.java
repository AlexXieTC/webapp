package resultmapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import bean.User;

public class UserMapping implements ResultSetBeanMapping<User>{

	@Override
	public User createFromResultSet(ResultSet rs) throws SQLException {
		// TODO 自動生成されたメソッド・スタブ
		User user = new User();
		user.setId(rs.getString("user_id"));
		//パスワードはそのまま入れるとまずいので空文字を入れる
		user.setPassword("");
		user.setMoney(rs.getInt("money"));
		user.setSimulationDate(rs.getDate("simulation_date"));
		return user;
	}

}
