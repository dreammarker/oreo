package com.yedam.movie.view;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.movie.CommentsService;
import com.yedam.movie.CommentsVO;
import com.yedam.movie.InquiryService;
import com.yedam.movie.InquiryVO;
import com.yedam.movie.Paging;
import com.yedam.movie.SearchVO;

@Controller
@SessionAttributes("inquiry") // 모델에 board 속성이 추가된다면 session에도 추가
public class InquiryController {

	@Autowired
	InquiryService inquiryService;
	@Autowired
	CommentsService commentsService;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/")
	public String main(String movie_id, Model model)
			throws JsonParseException, JsonMappingException, MalformedURLException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> value;

		value = mapper.readValue(new URL(
				"http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=&targetDt=20180710"),
				new TypeReference<Map<String, Object>>() {
				});
		List<HashMap> dailyBoxOfficeList = (List<HashMap>) ((HashMap) value.get("boxOfficeResult"))
				.get("dailyBoxOfficeList");
		List<Map> result = new ArrayList<Map>();

		for (int i = 0; i < 5; i++) {
			HashMap map = new HashMap();
			map.put("rank", dailyBoxOfficeList.get(i).get("rank"));
			map.put("movieCd", dailyBoxOfficeList.get(i).get("movieCd"));
			map.put("movieNm", dailyBoxOfficeList.get(i).get("movieNm"));
			map.put("rate", dailyBoxOfficeList.get(i).get("salesShare"));
			/*
			 * map.put("seatRate",
			 * advanceRatingService.rate((String)dailyBoxOfficeList.get(i).get("movieCd")));
			 */
			result.add(map);
		}
		model.addAttribute("chart", result);
		return "nomypage/main";
	}

	@RequestMapping("/getInquiryList")
	public ModelAndView getInquiryList(HttpServletRequest request, SearchVO vo1,Paging paging) {
		 ModelAndView mv = new ModelAndView();
	      
	      //페이지 번호 파라미터
	      if(paging.getPage() == null) {
	         paging.setPage(1);
	      }
	      System.out.println(paging);
	      
	      //페이징 first,last 검색조건
	      //page 1 ==> 1~10  2 => 11~20
	      vo1.setFirst(paging.getFirst());
	      vo1.setLast(paging.getLast());
	      System.out.println(vo1);
	      //전체건수
	      paging.setTotalRecord(inquiryService.getCount(vo1));
	      //결과를 모델에 저장
	      mv.addObject("paging", paging);
	      mv.addObject("inquiryList", inquiryService.getInquiryList(vo1));
	      
	      //뷰페이지 지정
	      mv.setViewName("nomypage/boardList");
		/*request.setAttribute("inquiryList", inquiryService.getInquiryList());*/
		return mv;
	}

	// 수정폼
	@RequestMapping(value = "/inquiryUpdate/{inquiry_id}", method = RequestMethod.GET)
	public String updateInquiryForm(@PathVariable String inquiry_id, Model model) {
		model.addAttribute("OneView", inquiryService.getInquiry(inquiry_id));
		return "nomypage/boardModify";
	}

	// 수정처리
	@RequestMapping(value = "/inquiryUpdate/{inquiry_id}", method = RequestMethod.POST)
	public String updateInquiry(@ModelAttribute("OneView") InquiryVO vo) {
		System.out.println(vo);
		inquiryService.inquiryUpdate(vo);
		return "nomypage/boardView";
	}

	// 등록폼
	@RequestMapping(value = "/insertInquiry", method = RequestMethod.GET)
	public String insertInquiryForm() {
		return "nomypage/board";
	}

	// 등록처리
	@RequestMapping(value = "/insertInquiry", method = RequestMethod.POST)
	public String insertInquiry(InquiryVO vo) {
		System.out.println(vo);
		/*vo.setCustNum("183");
		vo.setInquiryContent("content");
		vo.setInquiryTitle("title");*/
		inquiryService.insertInquiry(vo);

		return "redirect:/getInquiryList";

	}

	@RequestMapping("/getInquiry/{inquiry_id}")
	public String getBoard(@PathVariable String inquiry_id, Model model, CommentsVO vo) {
		inquiryService.checkPlus(inquiry_id);
		vo.setBoardseq(inquiry_id);
		model.addAttribute("comments", commentsService.getCommentsList(vo));
		model.addAttribute("OneView", inquiryService.getInquiry(inquiry_id));
		return "nomypage/boardView";
	}

	@RequestMapping("/deleteInquiry/{inquiry_id}")
	public String deleteInquiry(@PathVariable String inquiry_id, Model model) throws IOException {
		inquiryService.deleteInquiry(inquiry_id);

		return "redirect:/getInquiryList";
	}

	/*
	 * @RequestMapping("/getInquiry") //경로 두개도 가능 /{title} public String
	 * getInquiry(@PathVariable String inquiry_id, Model model) //PathVariable 추가 가능
	 * { model.addAttribute("OneView",inquiryService.getInquiry(inquiry_id)); return
	 * "nomypage/boardView"; }
	 */

}