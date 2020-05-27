<%@page import="com.hanul.study.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String isbn = request.getParameter("isbn");
BookDAO dao = new BookDAO();
int succ = dao.delete(isbn);

if(succ > 0) {
	out.println("<script> alert('도서 정보 삭제 성공!');");
	out.println("location.href = 'bookSearchAll.jsp'; </script>");
} else {
	out.println("<script> alert('도서 정보 삭제 실패!');");
	out.println("location.href = 'bookSearchAll.jsp'; </script>");
}
%>