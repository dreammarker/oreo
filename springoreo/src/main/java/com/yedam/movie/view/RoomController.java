package com.yedam.movie.view;


import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.movie.RoomService;
import com.yedam.movie.RoomVO;

@Controller
public class RoomController {
	public class MyValue {
		public String theater;
		public String schedule;
	}

	@Autowired
	RoomService roomService;

	@SuppressWarnings("unchecked")
	@RequestMapping("/Insertroom")
	public String RoomInsert(RoomVO vo, HttpServletRequest request) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> value;
		RoomVO vo1 = new RoomVO();
		
		String theaCd = "012031\r\n" + "012053\r\n" + "012006\r\n" + "012051\r\n" + "012020\r\n" + "012034\r\n"
				+ "012050\r\n" + "012022\r\n" + "012033\r\n" + "012047\r\n" + "012046\r\n" + "012045\r\n" + "012014\r\n"
				+ "012018\r\n" + "012013\r\n" + "012032\r\n" + "012048\r\n" + "012015\r\n" + "012030\r\n" + "012007\r\n"
				+ "012043\r\n" + "012035\r\n" + "012044\r\n" + "012042\r\n"
				+ "012029\r\n"; /* request.getParameter("theaCd"); */
		String theaCd1[]=theaCd.split("\\r\\n");
		for(int j=0;j<theaCd1.length;j++) {
		String showDt = "20180707";/* request.getParameter("showDt"); */
		System.out.println(theaCd1[0]);
		String postParams = "theaCd=" + theaCd1[j] + "&showDt=" + showDt;
		vo1.setTheaterId(theaCd1[j]);
		value = mapper.readValue(
				new URL("http://www.kobis.or.kr/kobis/business/mast/thea/findSchedule.do?" + postParams),
				new TypeReference<Map<String, Object>>() {
				});

		Iterator<String> it = value.keySet().iterator();
		String temp = "";
		while (it.hasNext()) {
			temp = it.next();
			System.out.println(temp + " : " + value.get(temp));

		}
		
		@SuppressWarnings("rawtypes")
		List<HashMap> schedule = (List<HashMap>) value.get("schedule");
		List<String> uniqueItems = new ArrayList<String>(new HashSet<String>());

		for (int i = 0; i < schedule.size(); i++) {
			if (!uniqueItems.contains(schedule.get(i).get("scrnNm"))) {
				uniqueItems.add((String) schedule.get(i).get("scrnNm"));
			}
		}

		for (int i = 0; i < uniqueItems.size(); i++) {
			vo1.setRoomName(uniqueItems.get(i));
			String roomcheck=roomService.roomCheck(vo1);
			if(roomcheck==null) {
				roomService.RoomInsert(vo1);	
			}
			System.out.println(uniqueItems.get(i));
		}
		
		}
		return "";
	}
}
