package com.yedam.movie;

import java.util.List;
import java.util.Map;

public interface MyadvanceService {
	// 현재예매내역 조회
	public List<Map<String, Object>> getMyadvanceList(String custId);
	
	// 지난예매내역 조회
	public List<Map<String, Object>> getLastMyadvance(String custNum);
	
	// 예매 취소
	public void deleteMyadvance(MyadvanceVO myadvanceVO, PaymentVO paymentVO);
	
	// 스탬프 조회
	public MyadvanceVO getStamp(String custNum);
	
	// 마일리지 조회
	public MyadvanceVO getMileage(String custNum);



}
