package com.yedam.movie;

import java.util.List;
import java.util.Map;

public interface SeatService {
	//목록조회
	public List<Map<String, Object>> getSeatList(SeatVO vo);
	
	List<Map<String, Object>> getRemainSeatList();
}
