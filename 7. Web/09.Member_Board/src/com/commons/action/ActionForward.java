package com.commons.action;

public class ActionForward {
	private String path;			//View 페이지 경로와 파일명
	private boolean isRedirect;		//전환 방식
	
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
