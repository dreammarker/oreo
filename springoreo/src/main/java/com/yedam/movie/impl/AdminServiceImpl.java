package com.yedam.movie.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.movie.AdminService;
import com.yedam.movie.AdvanceVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired AdminDAO dao;
	
	//일별
	@Override
	public List<Map<String, Object>> salesStatusDay(AdvanceVO vo) {
		String day = vo.getAdvanceDate().substring(0, 7);
		vo.setAdvanceDate(day);
		return dao.salesStatusDay(vo);
	}
	//월별
	@Override
	public List<Map<String, Object>> salesStatusMonth(AdvanceVO vo) {
		String month = vo.getAdvanceDate().substring(0, 4);
		vo.setAdvanceDate(month);
		return dao.salesStatusMonth(vo);
	}

}
