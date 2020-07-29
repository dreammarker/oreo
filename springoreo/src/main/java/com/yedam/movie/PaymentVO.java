package com.yedam.movie;

public class PaymentVO {
	private String paymentId;
	private String paymentMethod;
	private String paymentAmount;
	private String paymentMileage;
	private String advanceId;
	private String custNum;
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(String paymentAmount) {
		this.paymentAmount = paymentAmount;
	}
	public String getPaymentMileage() {
		return paymentMileage;
	}
	public void setPaymentMileage(String paymentMileage) {
		this.paymentMileage = paymentMileage;
	}
	public String getAdvanceId() {
		return advanceId;
	}
	public void setAdvanceId(String advanceId) {
		this.advanceId = advanceId;
	}
	public String getCustNum() {
		return custNum;
	}
	public void setCustNum(String custNum) {
		this.custNum = custNum;
	}
	@Override
	public String toString() {
		return "PaymentVO [paymentId=" + paymentId + ", paymentMethod=" + paymentMethod + ", paymentAmount="
				+ paymentAmount + ", paymentMileage=" + paymentMileage + ", advanceId=" + advanceId + ", custNum="
				+ custNum + "]";
	}

}
