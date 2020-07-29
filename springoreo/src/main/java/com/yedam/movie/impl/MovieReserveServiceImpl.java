package com.yedam.movie.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.movie.MovieReserveService;
import com.yedam.movie.MovieReserveVO;
import com.yedam.movie.MovieVO;

@Service("movieReserveService")
public class MovieReserveServiceImpl implements MovieReserveService{
	
	@Autowired
	MovieReserveDAO dao;
	
	@Override
	public List<MovieReserveVO> MoviegenreCheck(MovieReserveVO vo1){
		return dao.MoviegenreCheck(vo1);
		
	}

	@Override
	public String Movie_Reserve(MovieReserveVO vo1) {
		return null;
	}
}

