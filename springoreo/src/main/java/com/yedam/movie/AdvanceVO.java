package com.yedam.movie;

public class AdvanceVO {
	private String custNum;
	private Integer stamp;
	private String mileage;
	private String advanceDate;
	private String advanceId;
	private String theaterName;
	private String screenDate;
	private String screenStartTime;
	private String movieTitle;
	private String roomName;
	private Integer advanceSeatNum;
	private String seatNumber;
	private String snack;
	private String screenId;
	
	public String getCustNum() {
		return custNum;
	}
	public void setCustNum(String custNum) {
		this.custNum = custNum;
	}
	public Integer getStamp() {
		return stamp;
	}
	public void setStamp(Integer stamp) {
		this.stamp = stamp;
	}
	public String getMileage() {
		return mileage;
	}
	public void setMileage(String mileage) {
		this.mileage = mileage;
	}
	public String getAdvanceDate() {
		return advanceDate;
	}
	public void setAdvanceDate(String advanceDate) {
		this.advanceDate = advanceDate;
	}
	public String getAdvanceId() {
		return advanceId;
	}
	public void setAdvanceId(String advanceId) {
		this.advanceId = advanceId;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public String getScreenDate() {
		return screenDate;
	}
	public void setScreenDate(String screenDate) {
		this.screenDate = screenDate;
	}
	public String getScreenStartTime() {
		return screenStartTime;
	}
	public void setScreenStartTime(String screenStartTime) {
		this.screenStartTime = screenStartTime;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public Integer getAdvanceSeatNum() {
		return advanceSeatNum;
	}
	public void setAdvanceSeatNum(Integer advanceSeatNum) {
		this.advanceSeatNum = advanceSeatNum;
	}
	public String getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(String seatNumber) {
		this.seatNumber = seatNumber;
	}
	public String getSnack() {
		return snack;
	}
	public void setSnack(String snack) {
		this.snack = snack;
	}
	public String getScreenId() {
		return screenId;
	}
	public void setScreenId(String screenId) {
		this.screenId = screenId;
	}
	
	@Override
	public String toString() {
		return "AdvanceVO [custNum=" + custNum + ", stamp=" + stamp + ", mileage=" + mileage + ", advanceDate="
				+ advanceDate + ", advanceId=" + advanceId + ", theaterName=" + theaterName + ", screenDate="
				+ screenDate + ", screenStartTime=" + screenStartTime + ", movieTitle=" + movieTitle + ", roomName="
				+ roomName + ", advanceSeatNum=" + advanceSeatNum + ", seatNumber=" + seatNumber + ", snack=" + snack
				+ ", screenId=" + screenId + "]";
	}
		
}
