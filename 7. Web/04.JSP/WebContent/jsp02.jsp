<%@page import="com.hanul.study.SumMachine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
SumMachine sm = new SumMachine();
int sum = sm.getSum(1, 100);
pageContext.setAttribute("sum", sum); //바인딩(연결) 객체 : Scope 설정
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP02</title>
</head>
<body>
두 수 사이의 누적합 : ${sum } <%-- EL 표기법(문법) --%>
</body>
</html>