package com.yedam.movie;

public class InquiryVO {
	private String inquiryId;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryDate;
	private String inquiryCheck;
	private String custNum;
	private String custId;

	public String getInquiryId() {
		return inquiryId;
	}

	public void setInquiryId(String inquiryId) {
		this.inquiryId = inquiryId;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public String getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(String inquiryDate) {
		this.inquiryDate = inquiryDate;
	}

	public String getInquiryCheck() {
		return inquiryCheck;
	}

	public void setInquiryCheck(String inquiryCheck) {
		this.inquiryCheck = inquiryCheck;
	}

	public String getCustNum() {
		return custNum;
	}

	public void setCustNum(String custNum) {
		this.custNum = custNum;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	@Override
	public String toString() {
		return "InquiryVO [inquiryId=" + inquiryId + ", inquiryTitle=" + inquiryTitle + ", inquiryContent="
				+ inquiryContent + ", inquiryDate=" + inquiryDate + ", inquiryCheck=" + inquiryCheck + ", custNum="
				+ custNum + ", custId=" + custId + "]";
	}

	

}
