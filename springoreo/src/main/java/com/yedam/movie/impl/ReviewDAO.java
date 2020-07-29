package com.yedam.movie.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.movie.ReviewVO;

@Repository
public class ReviewDAO {
	
	@Autowired SqlSessionTemplate mybatis;
	
	public void insertReview(ReviewVO reviewVO) {
		mybatis.insert("com.yedam.movie.MovieDAO.insertReview", reviewVO);
	}
	
	public void deleteReview(String reviewId) {
		mybatis.delete("com.yedam.movie.MovieDAO.deleteReview", reviewId);
	}
	
	public ReviewVO getReview(String reviewId) {
		return mybatis.selectOne("com.yedam.movie.MovieDAO.getReview", reviewId);
	}
}
