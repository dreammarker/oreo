package com.yedam.movie;

import java.util.List;

public interface CustomerService {
	//고객 등록
	public void CustomerInsert(CustomerVO vo);
	//고객 수정
	public void CustomerUpdate(CustomerVO vo);
	//고객 삭제
	public void CustomerDelete(CustomerVO vo);
	//단건 조회
	public CustomerVO getCustomer(CustomerVO vo);
	//전체 조회
	public List<CustomerVO> getCustomerList();
	//아이디 중복체크
	public boolean getCheckuser(String id);
	//로그인체크
	public CustomerVO loginCheck(CustomerVO login);


	
}
