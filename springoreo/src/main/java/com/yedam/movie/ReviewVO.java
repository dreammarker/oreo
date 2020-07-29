package com.yedam.movie;

public class ReviewVO {
	
	private String reviewId;
	private String reviewStar;
	private String reviewContent;
	private String movieId;
	private String custNum;
	
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public String getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public String getCustNum() {
		return custNum;
	}
	public void setCustNum(String custNum) {
		this.custNum = custNum;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [reviewId=" + reviewId + ", reviewStar=" + reviewStar + ", reviewContent=" + reviewContent
				+ ", movieId=" + movieId + ", custNum=" + custNum + "]";
	}

}
