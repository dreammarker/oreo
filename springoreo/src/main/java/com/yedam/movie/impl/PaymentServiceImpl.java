package com.yedam.movie.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.movie.AdvanceVO;
import com.yedam.movie.CustomerVO;
import com.yedam.movie.PaymentService;
import com.yedam.movie.PaymentVO;
import com.yedam.movie.SnackVO;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	PaymentDAO pao;
	@Autowired
	SnackDAO sao;
	@Autowired
	AdvanceDAO aao;

	@Override
	public List<Map<String, Object>> getPaymentList(PaymentVO vo) {
		
		return pao.getPaymentList(vo);
	}

	@Override
	//결제시 각VO에 insert
	public void insertPayment(PaymentVO paymentVO, SnackVO snackVO, AdvanceVO advanceVO, CustomerVO customerVO) {
		aao.insertAdvance(advanceVO);
		
		snackVO.setAdvanceId(advanceVO.getAdvanceId());
		sao.insertSnack(snackVO);
		
		paymentVO.setAdvanceId(advanceVO.getAdvanceId());
		pao.insertPayment(paymentVO);	
		
		//프로시저 IN변수 담는 MAP
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("p_advanceId", advanceVO.getAdvanceId());
		map.put("p_custNum", advanceVO.getCustNum());
		map.put("cust_mileage", paymentVO.getPaymentMileage());
		map.put("adv_seat_num", advanceVO.getAdvanceSeatNum());
		
		pao.stampUpdateProc(map);
		
	}

	@Override
	public void deletePayment(String advanceId) {
		pao.deletePayment(advanceId);
		
	}

}
