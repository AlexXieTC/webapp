package bean;

import java.sql.Date;

public class History {
	private int stockCode;
	private String stockName;
	private String userID;
	private Date simulationDate;
	private int number;
	private int openPrice;
	private int money;

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getClosingPrice() {
		return openPrice;
	}

	public void setClosingPrice(int closingPrice) {
		this.openPrice = closingPrice;
	}

	public History() {

	}

	public String getStockName() {
		return stockName;
	}

	public void setStockName(String stockName) {
		this.stockName = stockName;
	}


	public String getId() {
		return userID;
	}

	public void setId(String userID) {
		this.userID = userID;
	}

	public Date getSimulationDate() {
		return simulationDate;
	}

	public void setSimulationDate(Date simulationDate) {
		this.simulationDate = simulationDate;
	}
	public int getStockCode() {
		return stockCode;
	}

	public void setStockCode(int stockCode) {
		this.stockCode = stockCode;

	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

}
