package com.yedam.movie.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.movie.CustomerService;
import com.yedam.movie.CustomerVO;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	CustomerDAO dao;

	@Override
	public void CustomerInsert(CustomerVO vo) {
		dao.CustomerInsert(vo);
		
	}

	@Override
	public void CustomerUpdate(CustomerVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void CustomerDelete(CustomerVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CustomerVO getCustomer(CustomerVO vo) {
		return dao.getCustomer(vo);
	}

	@Override
	public boolean getCheckuser(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public CustomerVO loginCheck(CustomerVO login) {
		return dao.loginCheck(login);
	}

	@Override
	public List<CustomerVO> getCustomerList() {
		return dao.getCustomerList();
	}
	
}
