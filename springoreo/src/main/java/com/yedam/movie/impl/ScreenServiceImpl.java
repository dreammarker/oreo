package com.yedam.movie.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.movie.ScreenSearchVO;
import com.yedam.movie.ScreenService;
import com.yedam.movie.ScreenVO;

@Service("screenService")
public class ScreenServiceImpl implements ScreenService{

	@Autowired
	ScreenDAO dao;
	
	@Override
	public void Screeninsert(ScreenVO vo) {
		dao.Screeninsert(vo);
	}



	@Override
	public void Screenupdate(ScreenVO vo) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public String Screencheck(ScreenVO vo) {
		return dao.Screencheck(vo);
	}



	@Override
	public List<HashMap<String, Object>> Checkscreen(ScreenSearchVO vo) {
		return dao.Checkscreen(vo);
	}



	@Override
	public int getCount(ScreenSearchVO vo) {
		return dao.getCount(vo);
	}



	



	

}
