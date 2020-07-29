package com.yedam.movie.view;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.movie.Paging;
import com.yedam.movie.RoomService;
import com.yedam.movie.RoomVO;
import com.yedam.movie.ScreenSearchVO;
import com.yedam.movie.ScreenService;
import com.yedam.movie.ScreenVO;

@Controller
public class ScreenController {

	@Autowired
	ScreenService screenService;

	@Autowired
	RoomService roomService;

	@RequestMapping("/screeninsertgo")
	public String Screengo() {
		return "/nomypage/screenInsert";
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/insertScreen")
	public String Screeninsert(String showDt,HttpServletRequest request)
			throws JsonParseException, JsonMappingException, MalformedURLException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> value;
		RoomVO roomvo = new RoomVO();
		String theaCd = "012031\r\n" + "012053\r\n" + "012006\r\n" + "012051\r\n" + "012020\r\n" + "012034\r\n"
				+ "012050\r\n" + "012022\r\n" + "012033\r\n" + "012047\r\n" + "012046\r\n" + "012045\r\n" + "012014\r\n"
				+ "012018\r\n" + "012013\r\n" + "012032\r\n" + "012048\r\n" + "012015\r\n" + "012030\r\n" + "012007\r\n"
				+ "012043\r\n" + "012035\r\n" + "012044\r\n" + "012042\r\n" + "012029\r\n";
		String theaCd1[] = theaCd.split("\\r\\n");
		showDt = request.getParameter("showDt");
		System.out.println(showDt);
		for (int w = 0; w < theaCd1.length; w++) {
			roomvo.setTheaterId(theaCd1[w]);
			ScreenVO vo = new ScreenVO();
			value = mapper.readValue(new URL("http://www.kobis.or.kr/kobis/business/mast/thea/findSchedule.do?theaCd="
					+ theaCd1[w] + "&showDt=" + showDt), new TypeReference<Map<String, Object>>() {
					});
			List<HashMap> schedule = (List<HashMap>) value.get("schedule");
			System.out.println(value);
			for (int i = 0; i < schedule.size(); i++) {
				// roomId 값 가져와서 셋팅하기
				String scrnNm = (String) schedule.get(i).get("scrnNm");
				roomvo.setRoomName(scrnNm);
				String roomId = roomService.roomCheck(roomvo);
				System.out.println(roomId);
				// 영화CD 값 가져오기
				String movieCd = (String) schedule.get(i).get("movieCd");
				System.out.println(movieCd);
				// 영화 showTm 가져오기
				String[] showTm = ((String) schedule.get(i).get("showTm")).split(",");
				// 0930 ->09:30
				for (int j = 0; j < showTm.length; j++) {
					System.out.println(showTm[j]);
					showTm[j] = showTm[j].substring(0, 2) + ":" + showTm[j].substring(2, showTm[j].length());
					System.out.println(showTm[j]);
				}
				// 영화상영내역 insert 하기
				for (int j = 0; j < showTm.length; j++) {
					vo.setScreenDate(showDt); // 상영날짜
					vo.setScreenStartTime(showTm[j]); // 상영시간
					vo.setRoomId(roomId); // ROOMid값 가져오기
					vo.setMovieId(movieCd); // 영화 CD값 세팅
					System.out.println(vo + "=============================================");
					if (screenService.Screencheck(vo) == null || screenService.Screencheck(vo) == "") {
						System.out.println("123123123123123=====================================");
						if (showTm[j] != null || showTm[j] != "") {
							System.out.println("값입력");
							screenService.Screeninsert(vo);
						}
					}
				}
			}
		}
		return "nomypage/screenInsert";
	}

	@RequestMapping("/checkScreen")
	public ModelAndView checkScreen(ScreenSearchVO vo,Paging paging,HashMap<String,Object> map,String showDt, HttpSession session,HttpServletRequest request) {
		if(request.getParameter("showDt")!=null||request.getParameter("showDt")!="") {
			vo.setScreenDate(request.getParameter("showDt"));
			session.setAttribute("showDt", request.getParameter("showDt"));
		}
		ModelAndView mv = new ModelAndView();
		if(paging.getPage()==null)
			paging.setPage(1);
		
		//페이징 first,last 검색조건
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		vo.setScreenDate((String) session.getAttribute("showDt"));
		paging.setTotalRecord(screenService.getCount(vo));
		System.out.println(vo);
		mv.addObject("paging",paging);
		
		mv.addObject("List", screenService.Checkscreen(vo));

		mv.setViewName("nomypage/screenInsert");
		return mv;
	}

}
