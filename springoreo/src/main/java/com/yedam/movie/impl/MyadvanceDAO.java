package com.yedam.movie.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.movie.MyadvanceVO;

@Repository
public class MyadvanceDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
		//전체조회
		public List<Map<String, Object>> getMyadvanceList(String custNum){
			return mybatis.selectList("com.yedam.movie.MyadvanceDAO.getMyadvanceList",custNum);
			
		}
		// 지난예매내역 조회
		public List<Map<String, Object>> getLastMyadvance(String custNum){
			return mybatis.selectList("com.yedam.movie.MyadvanceDAO.getLastMyadvance", custNum);
		}
		
		//삭제
		public void deleteMyadvance(String advanceId) {
			mybatis.delete("com.yedam.movie.MyadvanceDAO.deleteMyadvance", advanceId);
		}
		
		//스탬프조회
		public MyadvanceVO getStamp(String custNum) {
			return mybatis.selectOne("com.yedam.movie.MyadvanceDAO.getStamp", custNum);
		}
		
		//프로시저
		public void advanceCancelProc(HashMap<String, Object> map) {
			mybatis.insert("com.yedam.movie.MyadvanceDAO.advanceCancelProc", map);			
		}
		
		// 마일리지 조회
		public MyadvanceVO getMileage(String custNum) {
			return mybatis.selectOne("com.yedam.movie.MyadvanceDAO.getMileage", custNum);
		}
		

}

