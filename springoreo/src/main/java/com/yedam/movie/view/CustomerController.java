package com.yedam.movie.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.movie.CustomerService;
import com.yedam.movie.CustomerVO;


@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/Customerjoin")
	public String getCustomerList(HttpServletRequest request) {
		return "/nomypage/project_join";
	}
	
	@RequestMapping("/CustomerIdCheck")
	@ResponseBody
	public CustomerVO getCustomer(CustomerVO vo1,Model model){
		System.out.println("cust_num"+vo1.getCustNum());
		System.out.println("cust_id"+vo1.getCustId());
		CustomerVO vo=customerService.getCustomer(vo1);
		System.out.println(vo);
		if(vo!=null) {
			return vo;
		}
		else
		return new CustomerVO();
	
	}
	@RequestMapping("/insertCustomer")
	public String CustomerInsert(HttpServletRequest request, CustomerVO vo,Model model) {
			customerService.CustomerInsert(vo);
		return "redirect:/";
	}
	
	@RequestMapping("/login_check")
	public String loginCheck(HttpSession session,CustomerVO vo,Model model, HttpServletResponse response) throws IOException {
		CustomerVO vo1=customerService.loginCheck(vo);
		Date date =new Date();
		SimpleDateFormat yyyy= new SimpleDateFormat("yyyy");
		if(vo1!=null) {
			session.setAttribute("custNum", vo1.getCustNum());
			session.setAttribute("custId", vo1.getCustId());
			//나이계산  
			session.setAttribute("custBirth", Integer.parseInt(yyyy.format(date))+1-Integer.parseInt(vo1.getCustBirth().substring(0, 4)));
			System.out.println(Integer.parseInt(yyyy.format(date))+1);
			System.out.println(Integer.parseInt(vo1.getCustBirth().substring(0, 4)));
			System.out.println(vo1.getCustNum());
			System.out.println(vo1.getCustId()+"============");
			return "redirect:/";
		}
		else if(vo.getCustId()==null||vo.getCustId()==""){
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('Please enter your ID'); ");
			out.print("history.go(-1);");
			out.print("</script>");
			return null;
		}
		else if(vo.getCustPwd()==null||vo.getCustPwd()=="") {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('Please enter your password'); ");
			out.print("history.go(-1);");
			out.print("</script>");
			return null;
		}
		else {
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('Your ID or password is incorrect.'); ");
		out.print("history.go(-1);");
		out.print("</script>");
		return null;
		}
	}
	@RequestMapping("/logout")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
