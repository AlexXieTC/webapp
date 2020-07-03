package bean;

public class Asset implements Cloneable{

		private String userID;
		private int stockCode;
		private int number;


		public Asset() {

		}


		public String getUserID() {
			return userID;
		}


		public void setUserID(String userID) {
			this.userID = userID;
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

		public Asset clone() throws CloneNotSupportedException {
			return (Asset)super.clone();
		}

}