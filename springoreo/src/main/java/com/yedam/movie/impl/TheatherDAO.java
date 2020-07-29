package com.yedam.movie.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.movie.MovieVO;
import com.yedam.movie.TheatherVO;

@Repository
public class TheatherDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<TheatherVO> getTheater_first_loc(MovieVO vo){
	return mybatis.selectList("com.yedam.movie.TheatherDAO.getTheater_first_loc",vo);
	}
	
	public List<TheatherVO> getTheater_second_loc(MovieVO vo){
		return mybatis.selectList("com.yedam.movie.TheatherDAO.getTheater_second_loc",vo);
	}
	public List<TheatherVO> getScreenCheck(MovieVO vo){
		return mybatis.selectList("com.yedam.movie.TheatherDAO.getScreenCheck",vo);
	}
	public  List<TheatherVO> getMovie_time(TheatherVO vo){
		return mybatis.selectList("com.yedam.movie.TheatherDAO.getMovie_time",vo);
	}
}
