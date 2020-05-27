<%@page import="com.hanul.study.BookDTO"%>
<%@page import="com.hanul.study.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="com.hanul.study.BookDTO">
	<jsp:setProperty property="*" name="dto"/>
</jsp:useBean>

<%
BookDAO dao = new BookDAO();
int succ = dao.update(dto);

if (succ > 0) {
	out.println("<script> alert('도서 정보 수정 성공');");
	out.println("location.href = 'bookSearchAll.jsp'; </script>");
} else {
	out.println("<script> alert('도서 정보 수정 실패');");
	out.println("location.href = 'bookSearchAll.jsp'; </script>");
}
%>