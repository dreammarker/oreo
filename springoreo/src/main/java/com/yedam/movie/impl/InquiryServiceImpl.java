package com.yedam.movie.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.movie.InquiryService;
import com.yedam.movie.InquiryVO;
import com.yedam.movie.SearchVO;




@Service("inquiryService")
public class InquiryServiceImpl implements InquiryService{

	@Autowired
	InquiryDAO dao;
	@Override
	public List<Map<String, Object>> getInquiryList(SearchVO vo) {
		
		return dao.getInquiryList(vo);
	}
	
	public int getCount(SearchVO vo){
		return dao.getCount(vo);
	}
	
	@Override
	public InquiryVO getInquiry(String inquiry_id) {
		
		return dao.getInquiry(inquiry_id);
	}

	@Override
	public void insertInquiry(InquiryVO vo) {
		dao.insertInquiry(vo);
		
	}

	@Override
	public void inquiryUpdate(InquiryVO vo) {
		dao.inquiryUpdate(vo);
		
	}

	@Override
	public void deleteInquiry(String inquiry_id) {
		dao.deleteInquiry(inquiry_id);
	}
	
	@Override
	public void checkPlus(String inquiry_id) {
		dao.checkPlus(inquiry_id);
	}

}
