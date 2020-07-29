package com.yedam.movie;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlTransient;

public class CommentsVO {
	
	private String seq; //댓글번호
	private String comName; //이름
	private String comContent; //내용
	private String boardseq; //게시글번호(참조키)
	private String regdate;
	private int    pageUnit;	//조회할땐 필요 없는 부분
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
	public String getBoardseq() {
		return boardseq;
	}
	public void setBoardseq(String boardseq) {
		this.boardseq = boardseq;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	@Override
	public String toString() {
		return "CommentsVO [seq=" + seq + ", comName=" + comName + ", comContent=" + comContent + ", boardseq="
				+ boardseq + ", regdate=" + regdate + ", pageUnit=" + pageUnit + "]";
	}
	
	

	
}
