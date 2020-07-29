package com.yedam.movie.view;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.movie.AdvanceService;
import com.yedam.movie.AdvanceVO;
import com.yedam.movie.CustomerService;
import com.yedam.movie.CustomerVO;
import com.yedam.movie.PaymentService;
import com.yedam.movie.PaymentVO;
import com.yedam.movie.SeatService;
import com.yedam.movie.SeatVO;
import com.yedam.movie.SnackService;
import com.yedam.movie.SnackVO;

@Controller
public class ResvController {

	@Autowired SeatService seatService;
	@Autowired SnackService snackService;
	@Autowired PaymentService paymentService;
	@Autowired AdvanceService advanceService;
	@Autowired CustomerService customerService;

	@RequestMapping("/getSeatList")
	public String getReserveSeat(SeatVO vo, AdvanceVO avo, Model model, HttpSession session) 
	{	
		avo.setScreenId((String) session.getAttribute("screenId"));
		//avo.setScreenId("107");
		
		//Model정보 저장
		//model.addAttribute("seatList", seatService.getSeatList(vo)); 
		model.addAttribute("reserveseat", advanceService.getReserveSeat(avo));
		return "movie/getSeatList";		
	}
	
	@RequestMapping("/getSnackList")
	public String getSeatChoice(@RequestParam Integer personNum, 
								@RequestParam String seatName, 
								@RequestParam String seatPrice, 
								//SessionVO sessionvo
								SeatVO vo, Model model, HttpSession session) 
	{
		session.setAttribute("personNum", personNum);
		session.setAttribute("seatName", seatName);
		session.setAttribute("seatPrice", seatPrice);
		
		//session.setAttribute("seat", sessionvo);
		
		return "movie/getSnackList";		

	}
	
	@RequestMapping("/getPaymentList")
	public String getSnackList(	@RequestParam String snack, 
								@RequestParam String snackPrice, 
								@RequestParam String paymentAmount,
								SnackVO vo, CustomerVO cvo, AdvanceVO avo, Model model, HttpSession session) {
		
		session.setAttribute("snack", snack);
		session.setAttribute("snackPrice", snackPrice);
		session.setAttribute("paymentAmount", paymentAmount);
		
		model.addAttribute("snack", snackService.getSnackList(vo));
		//cvo.setCustId("aaa"); //세션 로그인
		cvo.setCustNum((String) session.getAttribute("custNum"));
		//avo.setAdvanceId((String) session.getAttribute("advanceId"));
		model.addAttribute("mileage", (customerService.getCustomer(cvo)).getmileage());
		//model.addAttribute("advanceId", (advanceService.getAdvanceId(avo.getAdvanceId())));
		
		return "movie/getPaymentList";
	}
	
	

	@RequestMapping("/main")
	public String getPaymentList(PaymentVO vo, Model model) {
		model.addAttribute("pay", paymentService.getPaymentList(vo));	
		return "movie/getPaymentList";
	}
	
	@RequestMapping(value = "/insertPayment", method = RequestMethod.POST)
	public String insertPayment(HttpServletRequest request, PaymentVO paymentVO, AdvanceVO advanceVO, SnackVO snackVO, CustomerVO customerVO, HttpSession session) {

		advanceVO.setAdvanceSeatNum((Integer)session.getAttribute("personNum"));
		advanceVO.setSeatNumber((String)session.getAttribute("seatName"));
		advanceVO.setCustNum((String)session.getAttribute("custNum"));
		advanceVO.setScreenId((String)session.getAttribute("screenId"));
		
		snackVO.setSnack((String)session.getAttribute("snack"));
		snackVO.setSnackPrice((String)session.getAttribute("snackPrice"));
	
		//파라미터는 name만 맞춰주면 VO에 자동으로 들어감 // 안써도됨
		/*paymentVO.setPaymentMethod(request.getParameter("paymentMethod"));
		paymentVO.setPaymentAmount(request.getParameter("paymentAmount"));
		paymentVO.setPaymentMileage(request.getParameter("paymentMileage"));*/
		
		paymentService.insertPayment(paymentVO, snackVO, advanceVO, customerVO);
		//세션값 제거
		session.removeAttribute("personNum");
		session.removeAttribute("seatName");
		//session.removeAttribute("custNum");
		session.removeAttribute("screenId");
		session.removeAttribute("snack");
		session.removeAttribute("snackPrice");
	
		return "redirect:/";
	}
	
}
