package com.yedam.movie;

import java.util.List;

import javax.servlet.http.HttpSession;




public interface TheatherService {
	public List<TheatherVO> getTheater_first_loc(MovieVO vo);
	
	public List<TheatherVO> getTheater_second_loc(MovieVO vo);
	
	public List<TheatherVO> getScreenCheck(MovieVO vo);
	
	public  List<TheatherVO> getMovie_time(TheatherVO vo);
	
	public String getseat(HttpSession session, MovieReserveVO vo);
}
