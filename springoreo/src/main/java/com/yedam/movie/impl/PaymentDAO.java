package com.yedam.movie.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.yedam.movie.PaymentVO;

@Repository
public class PaymentDAO {
	
	@Autowired SqlSessionTemplate mybatis;   //쓰레드 처리,커넥션관리 기능 추가
	
	public List<Map<String,Object>> getPaymentList(PaymentVO paymentVO){
		return mybatis.selectList("com.yedam.movie.PaymentDAO.getPaymentList", paymentVO);
	}

	public PaymentVO getPayment(String id) {
		return (PaymentVO)mybatis.selectOne("com.yedam.movie.PaymentDAO.getPayment", id);
	}
	public void insertPayment(PaymentVO paymentVO) {
		mybatis.insert("com.yedam.movie.PaymentDAO.insertPayment", paymentVO);
	}
	public void updatePayment(PaymentVO paymentVO) {
		mybatis.update("com.yedam.movie.PaymentDAO.updatePayment", paymentVO);
	}
	public void deletePayment(String advanceId) {
		mybatis.delete("com.yedam.movie.PaymentDAO.deletePayment", advanceId);
	}
	
	public void stampUpdateProc(HashMap<String, Object> map) {
		mybatis.insert("com.yedam.movie.PaymentDAO.stampUpdateProc", map);
	}
}
