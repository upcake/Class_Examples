<%@page import="com.board.study.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String id = (String) (session.getAttribute("id"));
BoardDTO dto = (BoardDTO) request.getAttribute("dto");

String board_content = dto.getBoard_content();
String replaceContent = board_content.replaceAll("\r\n", "<br/>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board view jsp</title>
<script type="text/javascript">
function fnUpdate(num) {
	if(confirm("수정하시겠습니까?")) {
		location.href = "boardModifyView.bo?board_num=" + num;
	}
	return false;
}

function fnDelete(num) {
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href = "boardDeleteAction.bo?board_num=" + num;
	}
	return false;
}

</script>
</head>
<body>
<div align="center">
	<h3>[상세 글 보기]</h3>
	<table border="1">
		<tr>
			<th>제목</th>
			<td><%=dto.getBoard_subject() %></td>		
			<th>조회수</th>
			<td align="center"><%=dto.getBoard_readcount() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" width="500"><%=replaceContent %></td>
		</tr>
		<tr>
			<th>첨부 파일</th>
			<td colspan="3" >
				<%if(dto.getBoard_file() == null) { %>
					첨부된 파일이 없습니다.
				<%} else { %>
					<a href="boardupload/<%=dto.getBoard_file()%>"><%=dto.getBoard_file() %></a>
				<%} %>
			</td>
		</tr>
		<tr align="center">
			<td colspan="4">
				<input type="button" value="수정하기" onclick="fnUpdate('<%=dto.getBoard_num() %>')" />
				<input type="button" value="삭제하기" onclick="fnDelete('<%=dto.getBoard_num() %>')" />
				<input type="button" value="목록보기" onclick="location.href='boardList.bo'"/>
			</td>
		</tr>
	</table>
</div>
</body>
</html>