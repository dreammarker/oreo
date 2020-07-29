package com.yedam.movie;

import java.util.List;
import java.util.Map;

public interface AdvanceService {
	
	List<Map<String, Object>> getAdvanceList(AdvanceVO vo);
	
	public String getReserveSeat(AdvanceVO vo);
	//등록
	public void advanceInsert(AdvanceVO vo);

}
