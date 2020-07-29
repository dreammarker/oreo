package com.yedam.movie;

public class SearchVO extends InquiryVO{

	private int first;
	private int last;
	
	
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	@Override
	public String toString() {
		return "SearchVO [first=" + first + ", last=" + last + "]";
	}
	
}
