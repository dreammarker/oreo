package com.yedam.movie.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.movie.MycustVO;

@Repository
public class MycustDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
			//단건조회
			public MycustVO getMycust(String custId) {
				return mybatis.selectOne("com.yedam.movie.MycustDAO.getMycust", custId);
			}
			
			//수정
			public void updateMycust(MycustVO vo) {
				mybatis.update("com.yedam.movie.MycustDAO.updateMycust", vo);
			}
}
