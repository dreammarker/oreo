package com.yedam.movie;

public class SeatVO {
	private String seatId;
	private String personNum;
	private String seatName;
	private String price;
	private String roomId;
	private String screenId;
	
	public String getSeatId() {
		return seatId;
	}
	public void setSeatId(String seatId) {
		this.seatId = seatId;
	}
	public String getPersonNum() {
		return personNum;
	}
	public void setPersonNum(String personNum) {
		this.personNum = personNum;
	}
	public String getSeatName() {
		return seatName;
	}
	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getScreenId() {
		return screenId;
	}
	public void setScreenId(String screenId) {
		this.screenId = screenId;
	}
	
	@Override
	public String toString() {
		return "SeatVO [seatId=" + seatId + ", personNum=" + personNum + ", seatName=" + seatName + ", price=" + price
				+ ", roomId=" + roomId + ", screenId=" + screenId + "]";
	}
	
}