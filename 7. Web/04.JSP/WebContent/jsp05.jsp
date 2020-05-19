<%@page import="com.hanul.study.MemberDAO"%>
<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
/*
//MVC Project에서 학습했던 Servlet 코드 : 순수 자바코드(POJO)
request.setCharacterEncoding("utf-8");
String irum = request.getParameter("irum");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
int age = Integer.parseInt(request.getParameter("age"));
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");
MemberDTO dto = new MemberDTO(irum, id, pw, age, addr, tel);
*/

request.setCharacterEncoding("utf-8");
MemberDTO dto = new MemberDTO();
dto.setIrum(request.getParameter("irum"));
dto.setId(request.getParameter("id"));
dto.setPw(request.getParameter("pw"));
dto.setAge(Integer.parseInt(request.getParameter("age")));
dto.setAddr(request.getParameter("addr"));
dto.setTel(request.getParameter("tel"));

MemberDAO dao = new MemberDAO();
dao.memberInsert(dto);
--%>

<% request.setCharacterEncoding("utf-8"); %>

<!-- id는 식별자, class에는 패키지명을 포함해서 적는다 -->
<!-- MemberDTO dto = new MemberDTO(); ◀ 같은 역할을 한다 -->
<!-- 액션 태그 내부에서는 이클립스에서 자동 완성 기능을 지원하지 않으므로 액션 태그 밖에서 자동 완성을 시킨다. -->
<jsp:useBean id="dto" class="com.hanul.study.MemberDTO">
	<!-- 모든 파라미터를 받기 위해 와일드 카드 문자(*)를 사용한다 -->
	<jsp:setProperty property="*" name="dto"/>
</jsp:useBean>

<jsp:useBean id="dao" class="com.hanul.study.MemberDAO" />

<%
int succ = dao.memberInsert(dto);
if(succ > 0) {
	out.println("<script>alert('회원가입 성공!');");
	out.println("location.href='jsp05Main.html'; </script>");
} else {
	out.println("<script>alert('회원가입 실패!');");
	out.println("location.href='jsp05Main.html'; </script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>