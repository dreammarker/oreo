package com.yedam.movie;

import java.util.List;
import java.util.Map;

	public interface MovieService {
	//목록조회
	List<Map<String, Object>> getMovieList(MovieVO vo);
	
	List<Map<String, Object>> getMovieFavoriteList(String custNum);
	
	//모든영화조회
	public List<String> movieList();
	
	//영화 이미지 업데이트
	
	public void movieimgUpdate(MovieVO vo);
	//관심영화삽입
	public void insertFavoriteMovie(MovieVO movievo);
	//관심영화삭제
	public void deleteFavoriteMovie(String favoriteId);
	//영화상세정보 단건조회(영화)
	public MovieVO getMovieInfo(String movieId);
	//영화상세정보 전체조회(배우)
	public List<Map<String, Object>> getActorInfo(String movieId);
	//영화상세정보 전체조회(리뷰)
	public List<Map<String, Object>> getMovieReview(String movieId);
	//영화평점 단건조회
	public String getMovieAvg(String movieId);	
	
	//영화 삽입 
	public void insertMovie(MovieVO vo);

	//영화 체크
	public String movieCheck(String movieCd);
	
	//지난영화페이징
	public Integer countMovie();
	}
