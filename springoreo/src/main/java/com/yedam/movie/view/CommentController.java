package com.yedam.movie.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.movie.CommentsService;
import com.yedam.movie.CommentsVO;

@Controller
public class CommentController {

	@Autowired CommentsService commentService;
/*	@RequestMapping("/ajaxTest")
	@ResponseBody
	public List<String> test(){//리턴하는 값의 타입을 public뒤에 넣어 주면 된다.
		List<String> list = 
		
				new ArrayList<String>();
		list.add("홍길동");
		list.add("이순신");
		list.add("을지문덕");
		return list;
		}*/
	
	//댓글 추가
	@RequestMapping("/insertComments")
	@ResponseBody
	public CommentsVO insertComments(CommentsVO vo) {
		commentService.insertComments(vo);
		return commentService.getComments(vo);	
		}
	// 수정
	@RequestMapping("/updateComments")
	@ResponseBody
	public CommentsVO updateComments(CommentsVO vo) {
		commentService.updateComments(vo);
		return commentService.getComments(vo);	
		}
	//삭제
	@RequestMapping("/deleteComments")
	@ResponseBody
	public CommentsVO deleteComments(CommentsVO vo) {
		commentService.deleteComments(vo);
		return vo;
		}
	//목록
	@RequestMapping("/getCommentsList")
	@ResponseBody
	public List<CommentsVO> getCommentsList(CommentsVO vo) {
		return commentService.getCommentsList(vo);	
		}
	
	}