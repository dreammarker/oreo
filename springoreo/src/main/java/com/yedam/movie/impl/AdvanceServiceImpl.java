package com.yedam.movie.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.movie.AdvanceService;
import com.yedam.movie.AdvanceVO;

@Service("advanceService")
public class AdvanceServiceImpl implements AdvanceService {

	@Autowired
	AdvanceDAO dao;
	
	@Override
	public List<Map<String, Object>> getAdvanceList(AdvanceVO vo) {
		return dao.getAdvanceList(vo);
	}

	public String getReserveSeat(AdvanceVO vo) {
		return dao.getReserveSeat(vo);
	}
	
	@Override
	public void advanceInsert(AdvanceVO vo) {
		dao.insertAdvance(vo);
	}
}
