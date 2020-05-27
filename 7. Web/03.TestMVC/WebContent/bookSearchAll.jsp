<%@page import="com.hanul.study.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hanul.study.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
BookDAO dao = new BookDAO();
ArrayList<BookDTO> list = dao.getAllList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록 조회</title>
<style type="text/css">
	* {
		margin: 0 auto;
	}
			
	fieldset {
			 width: 1000px;
	}
	
	legend {
		 font-size: 1.5em;
		 font-weight: bold;
	}

	td, th {
		 padding: 5px;
	}
</style>
</head>
<body>
	<fieldset>
		<legend>도서 목록 조회</legend>
		<table border='1'>
			<tr>
				<th>도서명</th>
				<th>저&nbsp;&nbsp;&nbsp;자</th>
				<th style='letter-spacing: 3px'>ISBN</th>
				<th>출판사</th>
				<th>단&nbsp;&nbsp;&nbsp;가</th>
				<th>수&nbsp;&nbsp;&nbsp;량</th>
				<th>가&nbsp;&nbsp;&nbsp;격</th>
				<th>삭&nbsp;&nbsp;&nbsp;제</th>
				<th>수&nbsp;&nbsp;&nbsp;정</th>
			</tr>
			<% for (BookDTO dto : list) { %>
				<tr align='center'>
					<td><%= dto.getTitle() %></td>
					<td><%= dto.getAuth() %></td>
					<td><%= dto.getIsbn() %></td>
					<td><%= dto.getComp() %></td>
					<td><%= dto.getCost() %></td>
					<td><%= dto.getSu() %></td>
					<td><%= dto.getPrice() %></td>
					<td><a href="bookDelete.jsp?isbn=<%= dto.getIsbn()%>" style= "text-decoration:none">삭&nbsp;&nbsp;&nbsp;제</a></td>
					<td><a href="bookGetByIsbn.jsp?isbn=<%= dto.getIsbn()%>" style= "text-decoration:none">수&nbsp;&nbsp;&nbsp;정</a></td>
				</tr>
			<% } %>
			<tr>
				<td colspan='9' align='center'><input type="button" value="도서 정보 입력" onclick="location.href='BookMain_jsp.html'"/></td>
			</tr>
		</table>
	</fieldset>
</body>
</html>