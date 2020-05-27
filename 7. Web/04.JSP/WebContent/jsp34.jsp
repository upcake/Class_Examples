<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 34</title>
</head>
<body>
<%--
○ JAVA 반복문 : for, while, do~while
○ JSTL 반복문 : <c:forEach>실행문</c:forEach>
	▲ <c:forEach var="반복변수명" begin="초기값" end="최종값" step="증감값">실행문</c:forEach>
 --%>
○ JAVA 반복문(for)<br />
<%
for(int i = 1; i <= 7; i++) {
	out.println("<font size=" + i + ">안녕하세요</font><br />");
}
%>
<br /><br />

○ JSTL 반복문(c:forEach)<br />
<c:forEach var="i" begin="1" end="7"> <!-- step의 값이 1이라면 생략가능하다. -->
	<font size="${i }" >반갑습니다</font><br />
</c:forEach>
<br /><br />
<c:forEach var="i" begin="1" end="7" step="2"> <!-- step의 값이 1이라면 생략가능하다. -->
	<font size="${i }" >반갑습니다</font><br />
</c:forEach>
</body>
</html>