package com.yedam.movie;

import java.util.List;
import java.util.Map;

public interface InquiryService {
		// 목록조회
		public List<Map<String, Object>> getInquiryList(SearchVO vo);

		public int getCount(SearchVO vo);

		// 단건조회
		public InquiryVO getInquiry(String inquiry_id);

		// 입력
		public void insertInquiry(InquiryVO vo);
		
		// 수정
		public void inquiryUpdate(InquiryVO vo);

		// 삭제
		public void deleteInquiry(String inquiry_id);
		
		//조회수 up
		public void checkPlus(String inquiry_id);

	
}
