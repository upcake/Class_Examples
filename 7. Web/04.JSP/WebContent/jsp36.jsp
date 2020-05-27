<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ArrayList<String> list = new ArrayList<>();
list.add("사과");
list.add("멜론");
list.add("오렌지");
list.add("바나나");
list.add("파인애플");

pageContext.setAttribute("list", list);	//현재 페이지에서 EL 문법에 활용 가능
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 36</title>
</head>
<body>
○ JAVA for<br />
<ul>
	<%
		for(int i = 0; i < list.size(); i++) {
			out.println("<li>" + list.get(i) + "</li>");
		}
	%>
</ul>
<hr />
○ JAVA forEach<br />
<ul>
	<%
		for(String str : list) {
			out.println("<li>" + str + "</li>");		}
	%>
</ul>
<hr />
○ EL 표기법<br />
<ul>
	<li>${list[0] }</li>
	<li>${list[1] }</li>
	<li>${list[2] }</li>
	<li>${list[3] }</li>
	<li>${list[4] }</li>
</ul>
<hr />
○ JSTL core<br />
<ul>
	<c:forEach var="i" items="${list }">
		<li>${i }</li>
	</c:forEach>
</ul>
</body>
</html>