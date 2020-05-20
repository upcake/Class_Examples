<%@page import="com.hanul.study.MemberDAO"%>
<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//request.setCharacterEncoding("utf-8");
//MemberDTO dto = new MemberDTO();
//dto.setIrum(request.getParameter("irum"));
//이하 생략
%>

<%request.setCharacterEncoding("utf-8"); %>
<!-- JSP 액션 태그 -->
<jsp:useBean id="dto" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="dto" /> <!-- 여기서 property는 form에서 넘어온 name 속성이다. -->
</jsp:useBean>

<%
MemberDAO dao = new MemberDAO();
int succ = dao.memberUpdate(dto);

if (succ > 0) {
	out.println("<script> alert('수정 성공!!!');");
	out.println("location.href = 'jsp06.jsp'; </script>");
} else {
	out.println("<script> alert('수정 실패!!!');");
	out.println("location.href = 'jsp06.jsp'; </script>");
}
%>