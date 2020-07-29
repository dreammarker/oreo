package com.yedam.movie;

public class ScreenVO {
	private String screenId;
	private String screenDate;
	private String screenStartTime;
	private String screenRemainSeat;
	private String roomId;
	private String movieId;
	
	@Override
	public String toString() {
		return "ScreenVO [screenId=" + screenId + ", screenDate=" + screenDate + ", screenStartTime=" + screenStartTime
				+ ", screenRemainSeat=" + screenRemainSeat + ", roomId=" + roomId + ", movieId=" + movieId + "]";
	}
	public String getScreenId() {
		return screenId;
	}
	public void setScreenId(String screenId) {
		this.screenId = screenId;
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
	public String getScreenRemainSeat() {
		return screenRemainSeat;
	}
	public void setScreenRemainSeat(String screenRemainSeat) {
		this.screenRemainSeat = screenRemainSeat;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	
}
