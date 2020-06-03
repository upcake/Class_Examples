package com.hanul.action;

public class ActionForward {
	private String path;		//View Page(*.jsp)의 경로와 파일명을 저장할 변수
	private boolean isRedirect;	//페이지 전환 방식 ▶ true : sendRedirect()
//												   ▶ false : forward()
	
	//Getter & Setter 만든다
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
}