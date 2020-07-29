package com.yedam.movie.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.movie.MovieReserveVO;
import com.yedam.movie.MovieVO;
import com.yedam.movie.TheatherService;
import com.yedam.movie.TheatherVO;

@Service("theatherService")
public class TheatherServiceimpl implements TheatherService{
	
	@Autowired
	TheatherDAO dao;


	@Override
	public List<TheatherVO> getTheater_first_loc(MovieVO vo) {
	/*	System.out.println(vo.getMovieId());
		System.out.println(vo.getEndDate());*/
		return dao.getTheater_first_loc(vo);
	}


	@Override
	public List<TheatherVO> getTheater_second_loc(MovieVO vo) {
		System.out.println(vo.getTheatherFirstLoc());
		return dao.getTheater_second_loc(vo);
	}


	@Override
	public List<TheatherVO> getScreenCheck(MovieVO vo) {
		return dao.getScreenCheck(vo);
	}


	@Override
	public List<TheatherVO> getMovie_time(TheatherVO vo) {
		return dao.getMovie_time(vo);
	}


	@Override
	public String getseat(HttpSession session, MovieReserveVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
