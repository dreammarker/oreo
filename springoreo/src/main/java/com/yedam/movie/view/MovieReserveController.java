package com.yedam.movie.view;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yedam.movie.MovieReserveService;
import com.yedam.movie.MovieReserveVO;

@Controller
@SessionAttributes("movie_reserve")
public class MovieReserveController {

	@Autowired
	MovieReserveService movieReserveService;
	
	//페이지 이동
	@RequestMapping("/Movie_reserve")
	public String Movie_Reserve(HttpSession session,MovieReserveVO vo1,HttpServletRequest request){
		session.setAttribute("movieId", request.getParameter("movieId"));
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("HH:mm");
		String str = dayTime.format(new Date(time));
		vo1.setScreenStartTime(str);
		session.setAttribute("time", str);
		System.out.println(str);
		return "/nomypage/movie_reserve";
	}
	
	
	@RequestMapping("/Movie_genre_reserve")
	@ResponseBody
	public List<MovieReserveVO> MoviegenreCheck(HttpSession session,HttpServletRequest request,MovieReserveVO vo1,Model model){
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("HH:mm");
		String str = dayTime.format(new Date(time));
		vo1.setScreenStartTime(str);
		session.setAttribute("time", str);
		session.setAttribute("moiveDate", vo1.getEndDate());
		vo1.setGenre(vo1.getMovieGenre().split(","));
		System.out.println(session.getAttribute("custBirth"));
		if(session.getAttribute("movieId")!=null) {
			vo1.setMovieId((String) session.getAttribute("movieId"));
			session.removeAttribute("movieId");
		}
		System.out.println(vo1.getScreenStartTime());
		System.out.println(vo1.getEndDate());
		System.out.println(vo1.getMovieGenre());
		System.out.println(vo1.getGenre());
		System.out.println(vo1.getMovieAge());
		return movieReserveService.MoviegenreCheck(vo1);
		
	}
	
	
	
	
}
