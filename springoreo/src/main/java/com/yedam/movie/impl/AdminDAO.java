package com.yedam.movie.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.movie.AdvanceVO;

@Repository
public class AdminDAO {
	
	@Autowired SqlSessionTemplate mybatis;
	
	//일별 매출현황
	public List<Map<String,Object>> salesStatusDay(AdvanceVO vo){
		return mybatis.selectList("com.yedam.movie.AdminDAO.salesStatusDay", vo);
	}
	
	//월별 매출현황
	public List<Map<String,Object>> salesStatusMonth(AdvanceVO vo){
		return mybatis.selectList("com.yedam.movie.AdminDAO.salesStatusMonth", vo);
	}
}
