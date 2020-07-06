package dao;

import bean.User;

public class RenewDateDAO {
	public static boolean update(User user) {
		String sql ="UPDATE userinformation SET "
				+"simulation_date = \'"+user.getSimulationDate()+"' ";
		return false;
	}
}
