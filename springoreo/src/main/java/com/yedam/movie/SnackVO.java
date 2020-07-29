package com.yedam.movie;

public class SnackVO {
	
	private String snackId;
	private String snack;
	private String snackPrice;
	private String advanceId;
	
	public String getSnackId() {
		return snackId;
	}
	public void setSnackId(String snackId) {
		this.snackId = snackId;
	}
	public String getSnack() {
		return snack;
	}
	public void setSnack(String snack) {
		this.snack = snack;
	}
	public String getSnackPrice() {
		return snackPrice;
	}
	public void setSnackPrice(String snackPrice) {
		this.snackPrice = snackPrice;
	}
	public String getAdvanceId() {
		return advanceId;
	}
	public void setAdvanceId(String advanceId) {
		this.advanceId = advanceId;
	}
	
	@Override
	public String toString() {
		return "SnackVO [snackId=" + snackId + ", snack=" + snack + ", snackPrice=" + snackPrice + ", advanceId="
				+ advanceId + "]";
	}
	
}
