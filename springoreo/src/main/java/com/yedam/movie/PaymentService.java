package com.yedam.movie;

import java.util.List;
import java.util.Map;

public interface PaymentService {
	//목록조회
	List<Map<String, Object>> getPaymentList(PaymentVO vo);
	//등록
	public void insertPayment(PaymentVO paymentVO, SnackVO snackVO, AdvanceVO advanceVO, CustomerVO customerVO);
	//삭제
	public void deletePayment(String advanceId);

}
