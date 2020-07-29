package com.yedam.movie;

import java.util.List;
import java.util.Map;

public interface AdminService {
	//일별 매출현황
	public List<Map<String,Object>> salesStatusDay(AdvanceVO vo);
	//월별 매출현황
	public List<Map<String,Object>> salesStatusMonth(AdvanceVO vo);

}
