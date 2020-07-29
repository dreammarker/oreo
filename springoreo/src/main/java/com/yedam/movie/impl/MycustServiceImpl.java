package com.yedam.movie.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.movie.MycustService;
import com.yedam.movie.MycustVO;

@Service("mycustService")
public class MycustServiceImpl implements MycustService{
	
	@Autowired
	MycustDAO dao;
	@Override
	public MycustVO getMycust(String custId) {
		// TODO Auto-generated method stub
		return dao.getMycust(custId);
	}
	@Override
	public void updateMycust(MycustVO vo) {
		// TODO Auto-generated method stub
		dao.updateMycust(vo);
	}
}
