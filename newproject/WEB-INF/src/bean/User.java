package bean;

import java.sql.Date;

public class User  implements Cloneable{
	private String userID;
	private String password;
	private int money;
	private Date simulationDate;

	public User() {

	}


	public User(String id, String password, int money, Date simulationDate) {
		super();
		this.userID = id;
		this.password = password;
		this.money = money;
		this.simulationDate = simulationDate;
	}


	public String getId() {
		return userID;
	}
	public void setId(String id) {
		this.userID = id;
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
	public User clone() throws CloneNotSupportedException{
		return (User)super.clone();
	}
}
