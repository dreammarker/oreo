package com.yedam.movie.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.movie.MyadvanceService;
import com.yedam.movie.MyadvanceVO;
import com.yedam.movie.PaymentVO;

@Service("myadvanceService")
public class MyadvanceServiceImpl implements MyadvanceService {

	@Autowired
	MyadvanceDAO dao;

	@Override
	public List<Map<String, Object>> getMyadvanceList(String custNum) {
		// TODO Auto-generated method stub
		return dao.getMyadvanceList(custNum);
	}

	@Override
	public List<Map<String, Object>> getLastMyadvance(String custNum) {
		// TODO Auto-generated method stub
		return dao.getLastMyadvance(custNum);
	}

	public void deleteMyadvance(MyadvanceVO myadvanceVO, PaymentVO paymentVO) {
		// TODO Auto-generated method stub
		dao.deleteMyadvance(myadvanceVO.getAdvanceId());

		// 프로시저 IN변수 담는 MAP
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("p_advance_id", myadvanceVO.getAdvanceId());
		map.put("p_cust_num", myadvanceVO.getCustNum());
		map.put("p_advance_seat_num", myadvanceVO.getAdvanceSeatNum());
		map.put("p_payment_mileage", paymentVO.getPaymentMileage());

		dao.advanceCancelProc(map);
	}

	@Override
	public MyadvanceVO getStamp(String custNum) {
		// TODO Auto-generated method stub
		return dao.getStamp(custNum);
	}

	@Override
	public MyadvanceVO getMileage(String custNum) {
		// TODO Auto-generated method stub
		return dao.getMileage(custNum);
	}

}
