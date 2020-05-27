<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL core문을 사용하기 위해서는 반드시 문서 상단에 기술 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
1. 기본 프로그래밍 Tag(변수, 배열, if, for, switch-case 등) ▶ core<br />
<%
int num = 100;
%>
JAVA num : <%=num %><br />

<%-- JSTL 변수 선언 : <c:set ~~> --%>
<c:set var="su1" value="200" />
JSTL su1 : ${su1 }<br />

<%-- JAVA num값을 JSTL su2 할당 --%>
<c:set var="su2" value="<%=num %>" />
JSTL su2 : ${su2 }<br />

<%-- JSTL su1 값과 su2 값을 더한 값 : result --%>
<c:set var="result" value="${su1 + su2 }" />
JSTL result : ${result }
</body>
</html>