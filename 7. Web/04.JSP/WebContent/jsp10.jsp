<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="dto"/>
</jsp:useBean>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP10</title>
</head>
<body>
	[매개 변수(Parameter)의 내용을 출력]<br />
	<!-- JSP를 이용한 출력 -->
	이름(JSP) : <%=dto.getIrum() %>
	<br />
	
	<!-- Action Tag를 이용한 출력 -->
	아이디(Action Tag) : <jsp:getProperty property="id" name="dto"/> <!-- 자동 완성으로 액션 태그 쉽게 만들수 있다. -->
	<br />
	
	<!-- EL(Expression Language) 문법을 이용한 출력 -->
	주소(EL) : ${dto.addr }
</body>
</html>