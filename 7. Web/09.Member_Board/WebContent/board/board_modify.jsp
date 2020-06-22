<%@page import="com.board.study.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String id = (String) session.getAttribute("id");
BoardDTO dto = (BoardDTO) request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board modify JSP</title>
</head>
<body>
<div align="center">
	<h3>[글 내용 수정하기]</h3>
	<form action="boardModifyAction.bo" method="post">
	<input type="hidden" name="board_num" value="<%=dto.getBoard_num()%>"/>
		<table border="1">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="board_subject" value="<%=dto.getBoard_subject() %>" required="required"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="15" cols="50" name="board_content" required="required"><%=dto.getBoard_content() %></textarea>
					<!-- textarea 태그 사이에서 들여쓰기를 하면 들여쓰기 만큼의 공백이 내용에 나와버린다. -->
				</td>
			</tr>
			<tr>
				<th>파일 첨부</th>
				<td><input type="file" name="board file" value="<%=dto.getBoard_file() %>" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기" />
					<input type="button" value="뒤로가기" onclick="history.back()"/>
					<!-- back은 바로 이전, go(-1)은 안의 인수만큼 이동 -->
					<input type= "button" value="목록보기" onclick="location.href='boardList.bo'" />
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>