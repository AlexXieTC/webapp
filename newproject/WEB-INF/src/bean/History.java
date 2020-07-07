package bean;

<<<<<<< HEAD
import java.sql.Date;

public class History {
	private int stockCode;
	private String stockName;
	private String userID;
	private Date simulationDate;
=======
public class History {
	private String userID;
	private String stockName;
	private int stockCode;
>>>>>>> a64be9e98972c018e670c4a1625c884251a899d2
	private int number;

	public History() {

	}

<<<<<<< HEAD
	public int getStockCode() {
		return stockCode;
	}

	public void setStockCode(int stockCode) {
		this.stockCode = stockCode;
=======
	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
>>>>>>> a64be9e98972c018e670c4a1625c884251a899d2
	}

	public String getStockName() {
		return stockName;
	}

	public void setStockName(String stockName) {
		this.stockName = stockName;
	}

<<<<<<< HEAD
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
=======
	public int getStockCode() {
		return stockCode;
	}

	public void setStockCode(int stockCode) {
		this.stockCode = stockCode;
>>>>>>> a64be9e98972c018e670c4a1625c884251a899d2
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
<<<<<<< HEAD
=======

>>>>>>> a64be9e98972c018e670c4a1625c884251a899d2
}
