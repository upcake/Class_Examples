<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
//방법 ①
String irum = request.getParameter("irum"); //▶ ${param.irum }
//중간 생략
//MemberDTO dto = new MemberDTO(irum, id, ~~~);

//방법 ②
MemberDTO dto = new MemberDTO();
dto.setIrum(irum);
dto.setId(request.getParameter("id"));
dto.setPw(request.getParameter("pw"));
dto.setAge(Integer.parseInt(request.getParameter("age")));
dto.setAddr(request.getParameter("addr"));
dto.setTel(request.getParameter("tel"));
//이하 생략
%>

<%
//현재 페이지에서 사용할 바인딩(연결) 객체 생성 : EL 문법에 사용
pageContext.setAttribute("dto", dto);
%>

<jsp:useBean id="actionDTO" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="actionDTO"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP20</title>
</head>
<body>
○ JSP 기본 출력<br />
이름 : <%=dto.getIrum() %><br />
아이디 : <%=dto.getId() %><br />
주소 : <%=dto.getAddr() %><br />
<br />
○ Action Tag 출력<br />
이름 : <jsp:getProperty property="irum" name="actionDTO"/><br />
아이디 : <jsp:getProperty property="id" name="actionDTO"/><br />
주소 : <jsp:getProperty property="addr" name="actionDTO"/><br />
<br />
ㅇ EL 문법 출력<br />
이름 : ${param.irum }(parameter), ${dto.irum }(dto), ${actionDTO.irum }(actionDTO)<br />
<!-- 파라미터, dto Getter and Setter, action태그 -->
<!-- dto 객체는 바인딩 객체를 만들지 않았다면 출력되지 않는다 -->
아이디 : ${param.id }(parameter), ${dto.id }(dto), ${actionDTO.id }(actionDTO)<br />
주소 : ${param.addr }(parameter), ${dto.addr }(dto), ${actionDTO.addr }(actionDTO)<br /> 
</body>
</html>