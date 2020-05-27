<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String[] fruit = {"사과", "멜론", "오렌지", "바나나", "파인애플"};
pageContext.setAttribute("fruit", fruit);	//현재 페이지에서 사용할 바인딩 객체 생성
//fruit가 다른 페이지에서 넘겨받았으면 바인딩 객체를 생성할 필요가 없으나
//현재 페이지에서 만들었으므로 EL 표기법에서 사용하기 위해 객체를 생성할 필요가 있다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 35</title>
</head>
<body>
○ JAVA 반복문(배열)<br />
<ul>
	<%
		for(int i = 0; i < fruit.length; i++) {
			out.println("<li>" + fruit[i] + "</li>");
		}
	%>
</ul>

<%--
JSTL 반복문 : <c:forEach>실행문</c:forEach>
	▶ <c:forEach var="반복변수명" items="${배열명}" >실행문</c:forEach>
 --%>
○ JSTL 반복문(배열)<br />
<ul>
	<c:forEach var="i" items="${fruit }">
		<li>${i }</li>
	</c:forEach>
</ul>
</body>
</html>