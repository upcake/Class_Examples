<%@ page import="net.htmlparser.jericho.Source"%>
<%@ page import="com.hanul.study.GjBusDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
GjBusDAO dao = new GjBusDAO();
Source source = dao.makeJson();
String data = source.toString();
int beginIndex = data.indexOf("[");
int endIndex = data.indexOf("]");
data = data.substring(beginIndex, endIndex + 1);
%>
<%=data %>