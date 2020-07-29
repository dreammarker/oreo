package com.yedam.movie.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yedam.movie.SeatService;
import com.yedam.movie.SeatVO;

@Service("seatService")
public class SeatServiceImpl implements SeatService {
	
	@Autowired
	SeatDAO dao;

	@Override
	public List<Map<String, Object>> getSeatList(SeatVO vo) {
		return dao.getSeatList(vo);
	}
	
	@Override
	public List<Map<String, Object>> getRemainSeatList() {
		return null;
	}


}
