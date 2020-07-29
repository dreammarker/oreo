package com.yedam.movie.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.movie.MyalbumVO;

@Repository
public class MyalbumDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	//영화앨범 전체조회
		public List<Map<String, Object>> getMyalbumList(String custNum){
			return mybatis.selectList("com.yedam.movie.MyalbumDAO.getMyalbumList", custNum);
		}
		//영화앨범 내용 삽입
		public void insertMyalbum(MyalbumVO vo) {
			mybatis.insert("com.yedam.movie.MyalbumDAO.insertMyalbum", vo);
		}
		//영화앨범 내용 수정
		public void updateMyalbum(MyalbumVO vo) {
			mybatis.update("com.yedam.movie.MyalbumDAO.updateMyalbum", vo);
		}
		//영화앨범 삭제
		public void deleteMyalbum(String albumId) {
			mybatis.delete("com.yedam.movie.MyalbumDAO.deleteMyalbum", albumId);
		}
}
