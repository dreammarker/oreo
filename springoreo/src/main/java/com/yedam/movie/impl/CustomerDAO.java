package com.yedam.movie.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.movie.CustomerVO;

@Repository
public class CustomerDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	//목록조회
		public List<CustomerVO> getCustomerList(){
			return mybatis.selectList("com.yedam.movie.CustomerDAO.getCustomerList");
		}
		
		public CustomerVO getCustomer(CustomerVO vo){
			return mybatis.selectOne("com.yedam.movie.CustomerDAO.getCustomer",vo);
		}
		public void CustomerInsert(CustomerVO vo) {
			mybatis.insert("com.yedam.movie.CustomerDAO.CustomerInsert",vo);
		}
		public CustomerVO loginCheck(CustomerVO login) {
			return mybatis.selectOne("com.yedam.movie.CustomerDAO.loginCheck", login);
		}
		
}
