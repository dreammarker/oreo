package com.yedam.movie.view;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.movie.MycustService;
import com.yedam.movie.MycustVO;

@Controller
public class MycustController {

	@Autowired
	MycustService mycustService;

	
	@RequestMapping("/getMycust")
	public String getMycust(Model model, HttpSession session){
		String custId = (String) session.getAttribute("custId"); 
		model.addAttribute("mycust", mycustService.getMycust(custId));
		return "mypage/cust_info";
	}
	
	
	@RequestMapping("/updateMycust")
	public String updateMycust( MycustVO vo, HttpServletResponse response, @RequestParam String custId) throws IOException {
		mycustService.updateMycust(vo);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('정보가 수정되었습니다.');</script>");
		return "redirect:/getMycust";
	}
	
	
}
