package com.yedam.movie.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.yedam.movie.MovieVO;

@Repository
public class MovieDAO {
	
	@Autowired SqlSessionTemplate mybatis;   //쓰레드 처리,커넥션관리 기능 추가
	
	//모든 영화조회
	public List<String> movieList(){
		return mybatis.selectList("com.yedam.movie.MovieDAO.movieList");
	}
	//모든 영화 이미지 업데이트
	
	public void movieimgUpdate(MovieVO vo) {
		mybatis.update("com.yedam.movie.MovieDAO.movieimgUpdate",vo);
	}
	
	public List<Map<String,Object>> getMovieList(MovieVO movieVO){
		return mybatis.selectList("com.yedam.movie.MovieDAO.getMovieList", movieVO);
	}
	
	public List<Map<String,Object>> getMovieFavoriteList(String custNum){
		return mybatis.selectList("com.yedam.movie.MovieDAO.getMovieFavoriteList", custNum);
	}
	
	public MovieVO getMovieInfo(String movieId) {
		return mybatis.selectOne("com.yedam.movie.MovieDAO.getMovieInfo", movieId);
	}
	public List<Map<String,Object>> getActorInfo(String movieId) {
		return mybatis.selectList("com.yedam.movie.MovieDAO.getActorInfo", movieId);
	}
	
	public List<Map<String, Object>> getMovieReview(String movieId){
		return mybatis.selectList("com.yedam.movie.MovieDAO.getMovieReview", movieId);

	}
	
	public String getMovieAvg(String movieId) {
		return mybatis.selectOne("com.yedam.movie.MovieDAO.getMovieAvg", movieId);
	}
	
	public void insertMovie(MovieVO movieVO) {
		mybatis.insert("com.yedam.movie.MovieDAO.insertMovie", movieVO);
	}
	public void updateMovie(MovieVO movieVO) {
		mybatis.update("com.yedam.movie.MovieDAO.updateMovie", movieVO);
	}
	public void deleteMovie(String id) {
		mybatis.delete("com.yedam.movie.MovieDAO.deleteMovie", id);
	}
	public String movieCheck(String movieCd) {
		return mybatis.selectOne("com.yedam.movie.MovieDAO.movieCheck",movieCd);
	}

	public void insertFavoriteMovie(MovieVO movievo) {
		mybatis.insert("com.yedam.movie.MovieDAO.insertFavoriteMovie", movievo);
	}
	public void deleteFavoriteMovie(String favoriteId) {
		mybatis.delete("com.yedam.movie.MovieDAO.deleteFavoriteMovie", favoriteId);
	}
	
	public Integer countMovie() {
		return mybatis.selectOne("com.yedam.movie.MovieDAO.countMovie");
	}
}
