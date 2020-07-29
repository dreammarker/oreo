package com.yedam.movie;

public class CustomerVO {
private String custNum;
private String custName;
private String custId;
private String custPwd;
private String custPhone;
private String custMail;
private String stamp;
private String custBirth;
private String mileage;

public String getCustNum() {
	return custNum;
}
public void setCustNum(String custNum) {
	this.custNum = custNum;
}
public String getCustName() {
	return custName;
}
public void setCustName(String custName) {
	this.custName = custName;
}
public String getCustId() {
	return custId;
}
public void setCustId(String custId) {
	this.custId = custId;
}
public String getCustPwd() {
	return custPwd;
}
public void setCustPwd(String custPwd) {
	this.custPwd = custPwd;
}
public String getCustPhone() {
	return custPhone;
}
public void setCustPhone(String custPhone) {
	this.custPhone = custPhone;
}
public String getCustMail() {
	return custMail;
}
public void setCustMail(String custMail) {
	this.custMail = custMail;
}
public String getStamp() {
	return stamp;
}
public void setStamp(String stamp) {
	this.stamp = stamp;
}
public String getCustBirth() {
	return custBirth;
}
public void setCustBirth(String custBirth) {
	this.custBirth = custBirth;
}
public String getmileage() {
	return mileage;
}
public void setmileage(String mileage) {
	this.mileage = mileage;
}
@Override
public String toString() {
	return "CustomerVO [custNum=" + custNum + ", custName=" + custName + ", custId=" + custId + ", custPwd=" + custPwd
			+ ", custPhone=" + custPhone + ", custMail=" + custMail + ", stamp=" + stamp + ", custBirth=" + custBirth
			+ ", mileage=" + mileage + "]";
}



}
