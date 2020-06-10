<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
MemberDAO dao = new MemberDAO();
String json = dao.memberSearchAllJson2();
%>
<%=json %>
