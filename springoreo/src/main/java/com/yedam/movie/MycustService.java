package com.yedam.movie;

public interface MycustService {
	// 마이페이지_고객정보 단건 조회
	public MycustVO getMycust(String custId);
	//고객정보 수정
	public void updateMycust(MycustVO vo);
	
}
