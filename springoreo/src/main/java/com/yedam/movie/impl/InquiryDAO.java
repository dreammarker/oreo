package com.yedam.movie.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.movie.InquiryVO;
import com.yedam.movie.SearchVO;



@Repository
public class InquiryDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	// 목록조회
		public List<Map<String, Object>> getInquiryList(SearchVO vo) {
			return mybatis.selectList("com.yedam.movie.impl.InquiryDAO.getInquiryList",vo);
		};

		public int getCount(SearchVO vo) {
			return mybatis.selectOne("com.yedam.movie.impl.InquiryDAO.getCount",vo);
		}
		public List<InquiryVO> getInquiryList2(InquiryVO vo) {
			System.out.println(vo);
			return mybatis.selectList("com.yedam.movie.impl.InquiryDAO.getInquiryList2", vo);
		};

		// 단건조회
		public InquiryVO getInquiry(String inquiry_id) {
			return mybatis.selectOne("com.yedam.movie.impl.InquiryDAO.getInquiry", inquiry_id);
		}

		// 입력
		public void insertInquiry(InquiryVO vo) {
			mybatis.insert("com.yedam.movie.impl.InquiryDAO.insertInquiry", vo);
		}

		// 수정
		public void inquiryUpdate(InquiryVO vo) {
			mybatis.update("com.yedam.movie.impl.InquiryDAO.inquiryUpdate", vo);
		}

		// 삭제
		public void deleteInquiry(String inquiry_id) {
			mybatis.delete("com.yedam.movie.impl.InquiryDAO.deleteInquiry",inquiry_id);
		}
		// 조회수
		public void checkPlus(String inquiry_id) {
			mybatis.delete("com.yedam.movie.impl.InquiryDAO.checkPlus",inquiry_id);
		}

}
