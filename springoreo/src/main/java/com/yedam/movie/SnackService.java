package com.yedam.movie;

import java.util.List;
import java.util.Map;

public interface SnackService {
	//목록조회
	List<Map<String, Object>> getSnackList(SnackVO vo);
	//등록
	public void insertSnack(SnackVO vo);
}
