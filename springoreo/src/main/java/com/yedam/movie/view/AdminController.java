package com.yedam.movie.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.movie.AdminService;
import com.yedam.movie.AdvanceVO;

@Controller
public class AdminController {

	@Autowired AdminService adminService;
	
	// 차트 페이지
	@RequestMapping("/chart") // 리턴값
	public String salesSatusDay() {
		return "nomypage/chart";
	}
	
	// 차트 데이터 ajax
	@RequestMapping("/salesStatusDay")	
	@ResponseBody // ajax로 넘겨줌
	public List<Map<String, Object>> salesStatusDay(AdvanceVO vo) {
		return adminService.salesStatusDay(vo);
	}
	
	// 차트 데이터 ajax
	@RequestMapping("/salesStatusMonth")	
	@ResponseBody // ajax로 넘겨줌
	public List<Map<String, Object>> salesStatusMonth(AdvanceVO vo) {
		return adminService.salesStatusMonth(vo);
	}
	
	// 엑셀출력(viewResolver이용)
	@RequestMapping("/salesExcelView")
	public ModelAndView salesExcelView(AdvanceVO vo) {
		List<Map<String, Object>> day = adminService.salesStatusDay(vo);
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		String[] header = {"Date", "Total"};	
		map.put("filename", "sales_day");
		map.put("datas", day);
		map.put("headers", header);

		return new ModelAndView("commonExcelView", map);
	}

}
