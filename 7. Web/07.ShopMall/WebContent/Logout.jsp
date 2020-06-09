<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
session.removeAttribute("id");	//세션 객체에서 id값을 제거
response.sendRedirect("LoginMain.jsp");
%>