package com.yedam.movie.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yedam.movie.ReviewService;
import com.yedam.movie.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewDAO dao;

	@Override
	public void insertReview(ReviewVO vo) {
		dao.insertReview(vo);
	}

	@Override
	public void deleteReview(String reviewId) {
		dao.deleteReview(reviewId);
	}

	@Override
	public ReviewVO getReview(String reviewId) {
		// TODO Auto-generated method stub
		return dao.getReview(reviewId);
	}

}
