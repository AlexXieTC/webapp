package bean;

import java.sql.Date;

public class Score {
	private String userID;
	private Date date;
	private long totalAsset;
	private int rank;

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public Score() {

	}

	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public long getTotalAsset() {
		return totalAsset;
	}
	public void setTotalAsset(long totalAsset) {
		this.totalAsset = totalAsset;
	}
}
