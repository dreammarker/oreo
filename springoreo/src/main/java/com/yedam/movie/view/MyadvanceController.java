package com.yedam.movie.view;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.movie.MyadvanceService;
import com.yedam.movie.MyadvanceVO;
import com.yedam.movie.PaymentVO;

@Controller
public class MyadvanceController {

	@Autowired MyadvanceService myadvanceService;
	
	@RequestMapping("/getMyadvanceList")
	public String getMyadvanceList(Model model, HttpSession session) {
		String custNum = (String) session.getAttribute("custNum");
		model.addAttribute("myadvance", myadvanceService.getMyadvanceList(custNum));
		model.addAttribute("mileage", myadvanceService.getMileage(custNum));
		model.addAttribute("stamp", myadvanceService.getStamp(custNum));	
		return "mypage/cust_reserve";
	}
	
	@RequestMapping("/getLastMyadvance")
	public String getLastMyadvance(Model model, @RequestParam String custNum) {
		model.addAttribute("lastmyadvance", myadvanceService.getLastMyadvance(custNum));
		return "mypage/lastadvance";
	}
	
	@RequestMapping("/deleteMyadvance")
	public String deleteMyadvance(Model model, MyadvanceVO myadvanceVO, PaymentVO paymentVO) {
		myadvanceService.deleteMyadvance(myadvanceVO, paymentVO);	
		return "redirect:/getMyadvanceList";
		
	}
	
}
