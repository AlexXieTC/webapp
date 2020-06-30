package bean;

import java.sql.Date;

public class Price {
	private int stockCode;
	private Date date;
	private int openPrice;
	public int getStockCode() {
		return stockCode;
	}

	public void setStockCode(int stockCode) {
		this.stockCode = stockCode;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getOpenPrice() {
		return openPrice;
	}

	public void setOpenPrice(int openPrice) {
		this.openPrice = openPrice;
	}

	public int getClosingPrice() {
		return closingPrice;
	}

	public void setClosingPrice(int closingPrice) {
		this.closingPrice = closingPrice;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	private int closingPrice;
	private int volume;

	public Price() {

	}

}
