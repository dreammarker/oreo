package com.yedam.movie.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.movie.SnackVO;

@Repository
public class SnackDAO {
	
	@Autowired SqlSessionTemplate mybatis;   //쓰레드 처리,커넥션관리 기능 추가
	
	public List<Map<String,Object>> getSnackList(SnackVO snackVO){
		return mybatis.selectList("com.yedam.movie.SnackDAO.getSnackList", snackVO);
	}

	public SnackVO getSnack(String id) {
		return (SnackVO)mybatis.selectOne("com.yedam.movie.SnackDAO.getSnack", id);
	}
	public void insertSnack(SnackVO snackVO) {
		mybatis.insert("com.yedam.movie.SnackDAO.insertSnack", snackVO);
	}
	public void updateSnack(SnackVO snackVO) {
		mybatis.update("com.yedam.movie.SnackDAO.updateSnack", snackVO);
	}
	public void deleteSnack(String id) {
		mybatis.delete("com.yedam.movie.SnackDAO.deleteSnack", id);
	}
}
