<%@page import="com.hanul.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
List<BoardDTO> list = (List<BoardDTO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardSearchList</title>
</head>
<body>
<div align="center">
	<h3>[검색 결과]</h3>
	<table border="1" style="width: 80%;">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr> <%
			 if(list.size() == 0) {
				 out.println("<tr align='center'><td colspan='5'>작성된 글이 없습니다.</td></tr>");
			 } else {
				 for(int i = 0; i < list.size(); i++) {
					 out.println("<tr align='center'>");
						//out.println("<td>" + list.get(i).getB_num() + "</td>");
						out.println("<td>" + (list.size() - i) + "</td>");
						out.println("<td><a href='boardDetail.do?b_num=" + list.get(i).getB_num() + "'>" + list.get(i).getB_subject() + "</a></td>");
						out.println("<td>" + list.get(i).getB_writer() + "</td>");
						out.println("<td>" + list.get(i).getB_date() + "</td>");
						out.println("<td>" + list.get(i).getB_readcount() + "</td>");
					out.println("</tr>");
				 }
			 }
			 %>
			
			<tr align="center">
				<td colspan="5">
					<input type="button" value="글쓰기" onclick="location.href='boardInsertForm.do'" />
					<input type="button" value="글 목록" onclick="location.href='boardList.do'" />
				</td>
			</tr>
	</table>
	
</div>
</body>
</html>