package com.yedam.movie.view;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.movie.MovieService;
import com.yedam.movie.MovieVO;
import com.yedam.movie.Paging;
import com.yedam.movie.ReviewService;
import com.yedam.movie.ReviewVO;


@Controller
public class MovieController {
	@Autowired
	MovieService movieService;
	@Autowired
	ReviewService reviewService;

	/**
	 * @param request
	 * @return
	 */

	// 관심영화삭제
	@RequestMapping("/deleteFavoriteMovie")
	public String deleteFavoriteMovie(@RequestParam String favoriteId, MovieVO vo) {
		movieService.deleteFavoriteMovie(favoriteId);
		return "redirect:/getMovieFavoriteList";
	}

	// 관심영화삽입
	@RequestMapping("/insertFavoriteMovie")
	public String insertFavoriteMovie(MovieVO vo, @RequestParam String movieId) {
		movieService.insertFavoriteMovie(vo);
		return "redirect:/getMovieFavoriteList";
	}

	// 현재상영작 전체조회
	@RequestMapping("/getMovieList")
	public String getMovieList(MovieVO vo, Model model) {
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd");
		String str = dayTime.format(new Date(time));
		vo.setSearch("now");
		vo.setScreenDate(str);
		model.addAttribute("movie_now", movieService.getMovieList(vo));
		return "movie/getMovieList";
	}

	// 개봉예정작 전체조회
	@RequestMapping("/getMoviePreList")
	public String getMoviePreList(MovieVO vo, Model model) {
		vo.setSearch("pre");
		System.out.println(vo);
		model.addAttribute("movie_pre", movieService.getMovieList(vo));
		return "movie/getPreMovieList";
	}

	// 지난영화 전체조회
	@RequestMapping("/getMovieLastList")
	public String getMovieLastList(MovieVO vo, Model model, Paging paging) {
		ModelAndView mv = new ModelAndView();

		// 페이지 번호 파라미터
		if (paging.getPage() == null)
			paging.setPage(1);

		// 페이징 first, last 검색조건
		// page 1 ==> 1~10 2=>11~20
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		// 전체건수
		paging.setTotalRecord(movieService.countMovie());
		// 결과를 모델에 저장
		mv.addObject("paging", paging);
		vo.setSearch("last");
		model.addAttribute("movie_last", movieService.getMovieList(vo));
		model.addAttribute("countLast", movieService.countMovie());
		return "movie/getMovieList2";
	}

	// 관심영화 전체조회
	@RequestMapping("/getMovieFavoriteList")
	public String getMovieFavoriteList(Model model, HttpSession session) {
		String custNum = (String) session.getAttribute("custNum");
		model.addAttribute("movie_favorite", movieService.getMovieFavoriteList(custNum));
		return "movie/getMovieList3";
	}

	// 영화상세정보 단건조회
	@RequestMapping("/getMovieInfo")
	public String getMovieInfo(Model model, @RequestParam String movieId) {
		model.addAttribute("movieinfo", movieService.getMovieInfo(movieId));
		model.addAttribute("actorinfo", movieService.getActorInfo(movieId));
		model.addAttribute("review", movieService.getMovieReview(movieId));
		model.addAttribute("avg", movieService.getMovieAvg(movieId));
		return "movie/getMovieInfo";
	}

	@RequestMapping("/insertReview")
	@ResponseBody
	public ReviewVO insertReview(ReviewVO vo) throws IOException {
		reviewService.insertReview(vo);
		return reviewService.getReview(vo.getReviewId());
	}

	@RequestMapping("/deleteReview")
	@ResponseBody
	public ReviewVO deleteReview(ReviewVO vo) throws IOException {
		reviewService.deleteReview(vo.getReviewId());
		return reviewService.getReview(vo.getReviewId());
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/insertMovie")
	public String insertMovie(MovieVO vo)
			throws JsonParseException, JsonMappingException, MalformedURLException, IOException {

		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> value;
		MovieVO vo1 = new MovieVO();
		value = mapper.readValue(new URL(
				"http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=&openStartDt=2018&itemPerPage=1000"),
				new TypeReference<Map<String, Object>>() {
				});
		HashMap<String, Object> movieList = (HashMap<String, Object>) value.get("movieListResult");
		List<HashMap<String, Object>> movie = (List<HashMap<String, Object>>) movieList.get("movieList");
		List<String> movieId = new ArrayList<String>();

		for (int i = 0; i < movie.size(); i++)
			movieId.add((String) movie.get(i).get("movieCd")); // 영화Id 값 가져오기 2018년도

		for (int i = 0; i < movie.size(); i++)
			System.out.println(movieId.get(i));

		ObjectMapper mapper1 = new ObjectMapper();
		HashMap<String, Object> value1;
		for (int w = 0; w < movieId.size(); w++) {
			System.out.println(movieId.size());

			value1 = mapper1.readValue(new URL(
					"http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=&movieCd="
							+ movieId.get(w)),
					new TypeReference<Map<String, Object>>() {
					});
			System.out.println(value1);
			HashMap<String, Object> movieInfoResult = (HashMap<String, Object>) ((HashMap<String, Object>) value1
					.get("movieInfoResult")).get("movieInfo");

			System.out.println(movieInfoResult);
			List<HashMap<String, Object>> genres = null;
			if (movieInfoResult.get("genres") != null) {
				genres = (List<HashMap<String, Object>>) movieInfoResult.get("genres");
			}
			String Genre = "";

			if (genres != null) {
				for (int i = 0; i < genres.size(); i++) {
					Genre += genres.get(i).get("genreNm") + ",";
					if (i == genres.size() - 1)
						Genre = Genre.substring(0, Genre.length() - 1);
				}
			}
			System.out.println(Genre);

			List<HashMap<String, Object>> age = (List<HashMap<String, Object>>) movieInfoResult.get("audits");

			String movieAge = "";
			String ageCheck = "";
			if (movieInfoResult.get("audits") != null && age.size() != 0) {
				System.out.println(age);
				if (age.size() != 0 && age.get(0).get("watchGradeNm") != null && age.get(0).get("watchGradeNm") != "")
					ageCheck = ((String) age.get(0).get("watchGradeNm")).substring(0, 2);

				if (ageCheck.equals("청소"))
					movieAge = "19";
				else if (ageCheck.equals("전체"))
					movieAge = "0";
				else
					movieAge = ageCheck;
			}

			List<HashMap<String, Object>> directors = (List<HashMap<String, Object>>) movieInfoResult.get("directors");
			System.out.println(directors);
			String director = ""; // 감독을 받은 그릇
			if (directors != null) {
				for (int i = 0; i < directors.size(); i++) {
					director += directors.get(i).get("peopleNm") + ",";
					if (i == directors.size() - 1)
						director = director.substring(0, director.length() - 1);
				}
			}
			System.out.println("감독:=" + director);

			String movieCheck = movieService.movieCheck((String) movieInfoResult.get("movieCd"));

			if (movieCheck == null || movieCheck == "") {
				vo1.setMovieId((String) movieInfoResult.get("movieCd"));
				vo1.setMovieTitle((String) movieInfoResult.get("movieNm"));

				if (Genre != "")
					vo1.setMovieGenre(Genre);
				else
					vo1.setMovieGenre("장르없음");

				if ((String) movieInfoResult.get("showTm") != null) // 값이 아직 없는값은 update문과 select 문을 조합해서 영화정보가 업데이트되었을때
																	// 재실행할떄 업데이트 되도록 만드는것이 필요.
					vo1.setMovieShowtime((String) movieInfoResult.get("showTm") + "분");
				else
					vo1.setMovieShowtime("118분");

				if (movieAge != "")
					vo1.setMovieAge(movieAge);
				else
					vo1.setMovieAge("99");

				if (director != "")
					vo1.setMovieDirector(director);
				else
					vo1.setMovieDirector("감독업데이트필요");

				vo1.setMovieSummary("영화요약");
				vo1.setMovieTrailer("예고편");
				vo1.setMovieOpenDate((String) movieInfoResult.get("openDt"));
				vo1.setEndDate((String) movieInfoResult.get("openDt"));
				vo1.setMoviePoster((String) movieInfoResult.get("movieNm") + ".PNG");
				movieService.insertMovie(vo1);
			}

		}
		return "";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/updateimgMovie")
	public String updateimgMovie(MovieVO vo) {
		 String clientId = "";//애플리케이션 클라이언트 아이디값";
	     String clientSecret = "";//애플리케이션 클라이언트 시크릿값";
	     try {
	    	 List<String> list1 =movieService.movieList();
	    	 for(int i=0;i<list1.size();i++) {
	         System.out.println(list1.get(i));
	         String text =  URLEncoder.encode(list1.get(i),"utf-8");
	         System.out.println(text);
	         String apiURL = "https://openapi.naver.com/v1/search/movie?query="+text+"&";
	         URL url = new URL(apiURL);
	         HttpURLConnection con = (HttpURLConnection)url.openConnection();
	         con.setRequestMethod("GET");
	         con.setRequestProperty("X-Naver-Client-Id", clientId);
	         con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	         Thread.sleep(500);
	         int responseCode = con.getResponseCode();
	         BufferedReader br;
	         if(responseCode==200) { // 정상 호출
	             br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	         } else {  // 에러 발생
	             br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	         }
	         String inputLine;
	         StringBuffer response = new StringBuffer();
	         while ((inputLine = br.readLine()) != null) {
	             response.append(inputLine);
	         }
	         br.close();
	         if(response!=null) {
	         String str=response.toString();
	         System.out.println(str);
	         HashMap<String, Object> rs = new ObjectMapper().readValue(response.toString(), HashMap.class) ;
	         if(rs.get("items")!=null||rs.get("items")!="") {
	         List<HashMap<String,Object>> list =(List<HashMap<String, Object>>) rs.get("items");
	         if(list.size()!=0) {
	         String images=(String) list.get(0).get("image");
	         System.out.println(list.get(0).get("image")); 
	         vo.setMovieTitle(list1.get(i));
	         vo.setMoviePoster(images);
	          movieService.movieimgUpdate(vo);
	         }
	         }
	    	 }	 
	    	 }
	     } catch (Exception e) {
	         System.out.println(e);
	     }
	 
	     
		return "";
	}

}
