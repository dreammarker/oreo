package com.yedam.movie.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yedam.movie.SnackService;
import com.yedam.movie.SnackVO;

@Service("snackService")
public class SnackServiceImpl implements SnackService {
	
	@Autowired
	SnackDAO dao;

	@Override
	public List<Map<String, Object>> getSnackList(SnackVO vo) {
		return dao.getSnackList(vo);
	}

	@Override
	public void insertSnack(SnackVO vo) {
		dao.insertSnack(vo);
		
	}

	

}
