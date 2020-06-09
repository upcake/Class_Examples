<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");

//id 존재 유무, pw 일치 여부 검사 ▶ DB 연동해서 이상이 없으면
session.setAttribute("id", id);	//세션 바인딩(연결) 객체를 생성

//Cookie(쿠키) 설정 : 사용자쪽(Client)에 쿠키를 넣어준다.
Cookie ck = new Cookie("id", id);
ck.setMaxAge(60 * 60 * 24 * 365);	//쿠키가 존재하는 시간(유효 시간) : 1년짜리 쿠키
response.addCookie(ck);

response.sendRedirect("LoginMain.jsp");
%>