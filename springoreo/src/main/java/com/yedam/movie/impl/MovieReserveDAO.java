package com.yedam.movie.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.movie.MovieReserveVO;
import com.yedam.movie.MovieVO;
@Repository
public class MovieReserveDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<MovieReserveVO> MoviegenreCheck(MovieReserveVO vo1){
		return mybatis.selectList("com.yedam.movie.MovieReserveDAO.MoviegenreCheck",vo1);
	}
	
	
}
