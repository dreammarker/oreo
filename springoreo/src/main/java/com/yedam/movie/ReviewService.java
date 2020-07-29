package com.yedam.movie;

public interface ReviewService {

	//등록
	public void insertReview(ReviewVO vo);
	
	//삭제
	public void deleteReview(String reviewId);
	
	//리뷰단건조회
	public ReviewVO getReview(String reviewId);
}
