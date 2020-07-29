package com.yedam.movie.view;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yedam.movie.MovieReserveVO;
import com.yedam.movie.MovieVO;
import com.yedam.movie.TheatherService;
import com.yedam.movie.TheatherVO;

@Controller
@SessionAttributes("theather")
public class TheatherController {

	@Autowired
	TheatherService theatherService;
	
	@RequestMapping("/Movie_theather_loc")
	@ResponseBody
	public List<TheatherVO> getTheater_first_loc(HttpSession session,MovieVO vo,HttpServletRequest request){
		session.removeAttribute("movieId");
		if(request.getParameter("theatherFirstLoc")!=null) {
			vo.setMovieId(request.getParameter("theatherFirstLoc"));
		}
		System.out.println(request.getParameter("theatherFirstLoc"));
		System.out.println(vo.getMovieId());
		System.out.println(vo.getEndDate());
		session.setAttribute("movieId", vo.getMovieId());
		 return theatherService.getTheater_first_loc(vo);
	}
	
	@RequestMapping("/Movie_second_theather")
	@ResponseBody
	public List<TheatherVO> getTheater_second_loc(HttpSession session,MovieVO vo){
		session.setAttribute("theaterName", vo.getTheaterName());
		vo.setScreenStartTime((String) session.getAttribute("time"));
		return theatherService.getTheater_second_loc(vo);
		
	}
	@RequestMapping("/Movie_screen")
	@ResponseBody
	public List<TheatherVO> getScreenCheck(MovieVO vo){
		return theatherService.getScreenCheck(vo);
	}
	
	@RequestMapping("/screen_time")
	@ResponseBody
	public  List<TheatherVO> getMovie_time(TheatherVO vo){
		System.out.println(vo.getTheaterSecondLoc()+"================================");
		System.out.println("======="+vo.getScreenStartTime());
		
		 if(vo.getScreenStartTime()==null||vo.getScreenStartTime()=="") {
			vo.setScreenStartTime("0");
		}
		 else if(Integer.parseInt(vo.getScreenStartTime())<10) {
			vo.setScreenStartTime("0"+vo.getScreenStartTime());
		}
			
		return theatherService.getMovie_time(vo);
	}
	@RequestMapping("/seatcheck")
	public String getseat(HttpSession session,MovieReserveVO vo,HttpServletRequest request) {
		System.out.println(session.getAttribute("moiveDate"));
		System.out.println(vo.getCustNum()+"cust_num");
		System.out.println(session.getAttribute("movieId")+"movieId");
		System.out.println(request.getParameter("theatherName")+"theatherName");
		System.out.println(vo.getScreenEvent().substring(0, 4)+"screenEvent");
		System.out.println(vo.getScreenTimes());
		System.out.println(request.getParameter("movieName")+"movieName");
		System.out.println("screenid"+request.getParameter("screen_id"));
		session.setAttribute("screenId", request.getParameter("screen_id"));
		session.setAttribute("theatherName", request.getParameter("theatherName"));
		session.setAttribute("screenTimes", vo.getScreenTimes());
		session.setAttribute("custNum", vo.getCustNum());
		session.setAttribute("screenEvent", vo.getScreenEvent().substring(0, 4));
		session.setAttribute("movieName", request.getParameter("movieName"));
		return "redirect:/getSeatList";
	}
	
}
