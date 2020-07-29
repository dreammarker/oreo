package com.yedam.movie.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.movie.RoomVO;
@Repository
public class RoomDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public void RoomInsert(RoomVO vo) {
		mybatis.insert("com.yedam.movie.RoomDAO.RoomInsert",vo);
	}
	
	public String roomCheck(RoomVO vo) {
		return mybatis.selectOne("com.yedam.movie.RoomDAO.roomCheck",vo);
	}
}
