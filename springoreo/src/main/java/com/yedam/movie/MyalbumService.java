package com.yedam.movie;

import java.util.List;
import java.util.Map;

public interface MyalbumService {
	//영화앨범 전체조회
	public List<Map<String, Object>> getMyalbumList(String custNum);
	//영화앨범 내용 삽입
	public void insertMyalbum(MyalbumVO vo);
	//영화앨범 내용 수정
	public void updateMyalbum(MyalbumVO vo); 
	//영화앨범 삭제
	public void deleteMyalbum(String albumId);
	
	

}
