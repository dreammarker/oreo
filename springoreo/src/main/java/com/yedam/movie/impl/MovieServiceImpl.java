package com.yedam.movie.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.movie.MovieService;
import com.yedam.movie.MovieVO;
import com.yedam.movie.impl.MovieDAO;

@Service("movieService")
public class MovieServiceImpl implements MovieService {

	@Autowired
	MovieDAO dao;

	@Override
	public List<Map<String, Object>> getMovieList(MovieVO vo) {
		return dao.getMovieList(vo);
	}

	

	@Override
	public MovieVO getMovieInfo(String movieId) {
		// TODO Auto-generated method stub
		return dao.getMovieInfo(movieId);
	}

	@Override
	public List<Map<String,Object>> getActorInfo(String movieId) {
		// TODO Auto-generated method stub
		return dao.getActorInfo(movieId);
	}

	@Override
	public List<Map<String, Object>> getMovieReview(String movieId) {
		// TODO Auto-generated method stub
		return dao.getMovieReview(movieId);
	}

	@Override
	public String getMovieAvg(String movieId) {
		// TODO Auto-generated method stub
		return dao.getMovieAvg(movieId);
	}

	@Override
	public void insertMovie(MovieVO vo) {
		 dao.insertMovie(vo);
	}

	@Override
	public String movieCheck(String movieCd) {
		return dao.movieCheck(movieCd);
	}



	@Override
	public List<Map<String, Object>> getMovieFavoriteList(String custNum) {
		// TODO Auto-generated method stub
		return dao.getMovieFavoriteList(custNum);
	}



	@Override
	public void insertFavoriteMovie(MovieVO movievo) {
		// TODO Auto-generated method stub
		dao.insertFavoriteMovie(movievo);
		
	}



	@Override
	public void deleteFavoriteMovie(String favoriteId) {
		// TODO Auto-generated method stub
		dao.deleteFavoriteMovie(favoriteId);
		
	}



	@Override
	public List<String> movieList() {
		return dao.movieList();
	}



	@Override
	public void movieimgUpdate(MovieVO vo) {
		dao.movieimgUpdate(vo);
		
	}



	@Override
	public Integer countMovie() {
		// TODO Auto-generated method stub
		return dao.countMovie();
	}


}
