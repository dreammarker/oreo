package com.yedam.movie.impl;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.yedam.movie.SeatVO;

@Repository
public class SeatDAO {
	
	@Autowired SqlSessionTemplate mybatis;   //쓰레드 처리,커넥션관리 기능 추가
	
	public List<Map<String,Object>> getSeatList(SeatVO seatVO){
		return mybatis.selectList("com.yedam.movie.SeatDAO.getSeatList", seatVO);
	}
	
	public void insertSeat(SeatVO seatVO) {
		mybatis.insert("com.yedam.movie.SeatDAO.insertSeat", seatVO);
	}
	public void updateSeat(SeatVO seatVO) {
		mybatis.update("com.yedam.movie.SeatDAO.updateSeat", seatVO);
	}
	public void deleteSeat(String id) {
		mybatis.delete("com.yedam.movie.SeatDAO.deleteSeat", id);
	}
}
