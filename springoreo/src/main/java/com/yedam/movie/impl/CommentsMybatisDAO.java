package com.yedam.movie.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.movie.CommentsVO;

@Repository
public class CommentsMybatisDAO {

	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	 public void insertComments(CommentsVO vo){
		 sqlSession.insert("com.yedam.movie.impl.CommentsMybatisDAO.insertComments", vo);
	 }
	 
	 public void updateComments(CommentsVO vo){
		 sqlSession.update("com.yedam.movie.impl.CommentsMybatisDAO.updateComments", vo);
	 }
	 
	 public void deleteComments(CommentsVO vo){
		 sqlSession.delete("com.yedam.movie.impl.CommentsMybatisDAO.deleteComments", vo);
	 }	 	 
	 public List<CommentsVO> getCommentsList(CommentsVO vo){
		 return sqlSession.selectList("com.yedam.movie.impl.CommentsMybatisDAO.getCommentsList", vo); //목록조회
	 }
	 public CommentsVO getComments(CommentsVO vo){					//단건조회
		 return sqlSession.selectOne("com.yedam.movie.impl.CommentsMybatisDAO.getComments", vo);
	 }
}
