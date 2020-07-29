package com.yedam.movie.view;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.movie.MyalbumService;
import com.yedam.movie.MyalbumVO;


@Controller
public class MyalbumController {

		@Autowired MyalbumService myalbumService;
		
		@RequestMapping("/getMyalbumList")
		public String getMyalbumList(Model model, HttpSession session) {
			String custNum = (String) session.getAttribute("custNum");
			model.addAttribute("album", myalbumService.getMyalbumList(custNum));
			return "mypage/album";
		}
		@RequestMapping("/insertMyalbum")
		public String insertMyalbum(MyalbumVO vo, @RequestParam String movieId) throws IOException {
			myalbumService.insertMyalbum(vo);
			return "redirect:/getMyalbumList";
		}
		@RequestMapping("/updateMyalbum")
		public String updateMyalbum(MyalbumVO vo, @RequestParam String movieId) throws IOException {
			myalbumService.updateMyalbum(vo);
			return "redirect:/getMyalbumList";
		}
		
		@RequestMapping("/deleteMyalbum")
		public String deleteMyalbum(@RequestParam String albumId) throws IOException {
			myalbumService.deleteMyalbum(albumId);
			return "redirect:/getMyalbumList";
		}
}
