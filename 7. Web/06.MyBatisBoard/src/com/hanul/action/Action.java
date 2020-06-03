package com.hanul.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//추상 메서드(abstract를 안걸어도 인터페이스에서는 어짜피 추상메서드라 상관이 없다)
	public abstract ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}