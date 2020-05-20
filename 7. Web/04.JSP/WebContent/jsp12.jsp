<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
MemberDTO dto = (MemberDTO) request.getAttribute("dto");	//바인딩 객체를 받는다 ▶ 객체 타입을 MemberDTO 타입으로 캐스팅한다
%>

<!-- 식별자가 겹치면 안되므로 dto가 아닌 actionDto로 식별자를 정하였다. -->
<jsp:useBean id="actionDTO" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="actionDTO"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 12</title>
</head>
<body>
	이름(JSP) : <%=dto.getIrum() %>
	<br />
	
	아이디(Action Tag) : <jsp:getProperty property="id" name="actionDTO"/>
	<!-- 자바로 받은 dto 객체(dto)는 사용할 수 없고 액션 태그로 dto 객체(actionDTO)를 받아야 한다. -->
	<br />
	<!-- jsp:getProperty ~~  Action Tag는 반드시 jsp:useBean ~~ Action Tag로 객체가 생성되어있어야만 사용가능하다. -->
	
	주소(EL) : ${dto.addr }
	<br />
	
	전화번호(EL) : ${actionDTO.tel }
	<!-- EL은 자바든 액션태그든 둘 다 사용가능하다. -->
</body>
</html>