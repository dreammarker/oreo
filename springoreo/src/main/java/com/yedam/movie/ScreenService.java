package com.yedam.movie;

import java.util.HashMap;
import java.util.List;

public interface ScreenService {
	
	//상영내역 입력
	public void Screeninsert(ScreenVO vo);
	
	public void Screenupdate(ScreenVO vo);
	
	//값이 이미 있는지 확인!
	public String Screencheck(ScreenVO vo);
	
	public List<HashMap<String,Object>> Checkscreen(ScreenSearchVO vo);

	public int getCount(ScreenSearchVO vo);
}
