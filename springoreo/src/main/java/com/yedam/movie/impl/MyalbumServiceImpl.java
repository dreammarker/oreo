package com.yedam.movie.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.movie.MyalbumService;
import com.yedam.movie.MyalbumVO;


@Service("myalbumService")
public class MyalbumServiceImpl implements MyalbumService{

	@Autowired MyalbumDAO dao;
	
	@Override
	public List<Map<String, Object>> getMyalbumList(String custNum) {
		// TODO Auto-generated method stub
		return dao.getMyalbumList(custNum);
	}

	@Override
	public void insertMyalbum(MyalbumVO vo) {
		// TODO Auto-generated method stub
		dao.insertMyalbum(vo);
	}

	@Override
	public void updateMyalbum(MyalbumVO vo) {
		// TODO Auto-generated method stub
		dao.updateMyalbum(vo);
	}

	@Override
	public void deleteMyalbum(String albumId) {
		// TODO Auto-generated method stub
		dao.deleteMyalbum(albumId);
		
	}

}
