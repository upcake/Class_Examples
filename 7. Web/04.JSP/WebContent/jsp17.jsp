<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
//매개 변수 전달 받음
String irum = request.getParameter("irum");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
int age = Integer.parseInt(request.getParameter("age"));
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");
MemberDTO dto = new MemberDTO(irum, id, pw, age, addr, tel);
pageContext.setAttribute("dto", dto);	//현재 페이지에서 사용할 바인딩 객체 생성 : page scope
%>

<jsp:useBean id="actionDTO" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="actionDTO" />
</jsp:useBean>

<!-- dto 객체를 jsp18.jsp로 넘기자 : 바인딩(연결) 객체 -->
<%
request.setAttribute("dto", dto);	//현재 페이지와 요청한 페이지에 사용할 바인딩 객체 생성 : request scope
%>
<jsp:forward page="jsp18.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
○ 이름(JSP) : <%=irum %><br />
○ 이름(JSP, dto) : <%=dto.getIrum() %><br />
○ 이름(JSP, actionDTO) : <%=actionDTO.getIrum() %><br />
<br />
○ 아이디(Action Tag) : [jsp:getProperty] 매개 변수만 전달 받은 상태에서는 사용 불가능<br />
○ 아이디(Action Tag) : [jsp:getProperty] jsp:useBean으로 생성된 객체에서만 사용 가능<br />
○ 아이디(Action Tag) : <jsp:getProperty property="id" name="actionDTO"/><br />
<br />
○ 주소(EL, param) : ${param.addr }<br />
○ 주소(EL, dto) : ${dto.addr }<br />
○ 주소(EL, actionDTO) : ${actionDTO.addr }<br /><br />
</body>
</html>