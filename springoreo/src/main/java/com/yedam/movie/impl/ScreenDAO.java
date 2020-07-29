package com.yedam.movie.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.movie.ScreenSearchVO;
import com.yedam.movie.ScreenVO;

@Repository
public class ScreenDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	//영화내역삽입
	public void Screeninsert(ScreenVO vo) {
		mybatis.insert("com.yedam.movie.ScreenDAO.Screeninsert",vo);
	}
	
	public String Screencheck(ScreenVO vo) {
		return mybatis.selectOne("com.yedam.movie.ScreenDAO.Screencheck",vo);
	}
	
	public List<HashMap<String,Object>> Checkscreen(ScreenSearchVO vo){
		return mybatis.selectList("com.yedam.movie.ScreenDAO.Checkscreen",vo);
		
	}
	public int getCount(ScreenSearchVO vo) {
		return mybatis.selectOne("com.yedam.movie.ScreenDAO.getCount",vo);
	}
}
