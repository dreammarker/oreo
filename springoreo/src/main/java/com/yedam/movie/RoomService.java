package com.yedam.movie;

public interface RoomService {

	public void RoomInsert(RoomVO vo);
  //상영관 체크
	public String roomCheck(RoomVO vo);
}
