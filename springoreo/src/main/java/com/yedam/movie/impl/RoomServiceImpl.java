package com.yedam.movie.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.movie.RoomService;
import com.yedam.movie.RoomVO;
@Service("roomService")
public class RoomServiceImpl implements RoomService{

	@Autowired
	RoomDAO dao;
	
	@Override
	public void RoomInsert(RoomVO vo) {
		dao.RoomInsert(vo);
	}

	@Override
	public String roomCheck(RoomVO vo) {
		return dao.roomCheck(vo);
	}
	
	
}
