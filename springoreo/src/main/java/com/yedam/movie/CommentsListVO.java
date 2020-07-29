package com.yedam.movie;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="commentsList")
@XmlAccessorType(XmlAccessType.FIELD)
public class CommentsListVO {
	
	@XmlElement(name="comment")
	private List<CommentsVO> commentsList;//<CommentsVO>=필드명이 나중에 노드명이 된다.

	public List<CommentsVO> getCommentsList() {
		return commentsList;
	}

	public void setCommentsList(List<CommentsVO> commentsList) {
		this.commentsList = commentsList;
	}
	
}
