package com.yedam.movie.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.movie.AdvanceVO;

@Repository
public class AdvanceDAO {
	@Autowired SqlSessionTemplate mybatis;   //쓰레드 처리,커넥션관리 기능 추가
	
	public List<Map<String,Object>> getAdvanceList(AdvanceVO advanceVO){
		return mybatis.selectList("com.yedam.movie.AdvanceDAO.getAdvanceList", advanceVO);
	}
	
	public String getReserveSeat(AdvanceVO advanceVO){
		return mybatis.selectOne("com.yedam.movie.SeatDAO.getReserveSeat", advanceVO);
	}
	public void insertAdvance(AdvanceVO advanceVO) {
		mybatis.insert("com.yedam.movie.AdvanceDAO.insertAdvance", advanceVO);
	}
	public void updateAdvance(AdvanceVO advanceVO) {
		mybatis.update("com.yedam.movie.AdvanceDAO.updateAdvance", advanceVO);
	}
	public void deleteAdvance(String id) {
		mybatis.delete("com.yedam.movie.AdvanceDAO.deleteAdvance", id);
	}
}
