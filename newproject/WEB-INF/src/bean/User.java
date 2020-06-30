package bean;

import java.util.Date;

public class User {
	private String id;
	private String password;
	private int money;
	private Date simulationDate;

	public User() {

	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public Date getSimulationDate() {
		return simulationDate;
	}
	public void setSimulationDate(Date simulationDate) {
		this.simulationDate = simulationDate;
	}
}
