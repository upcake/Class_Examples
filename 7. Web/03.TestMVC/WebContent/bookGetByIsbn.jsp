<%@page import="com.hanul.study.BookDTO"%>
<%@page import="com.hanul.study.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String isbn = request.getParameter("isbn");
BookDAO dao = new BookDAO();
BookDTO dto = dao.getByIsbn(isbn);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 수정 화면</title>
<style type="text/css">
	* {
		margin: 0 auto;
		text-align: center;
	}
	
	fieldset {
		width: 400px;
	}

	legend {
		font-size: 1.5em;
		font-weight: bold;
	}

	td {
		padding: 5px;
	}
	
	.attribute {
		font-weight: bold;
	}
	
	.inputData {
		text-align: left;
		background-color: lightyellow;
	}
</style>
<script type="text/javascript">
	function fnUpdate() {
		if(confirm("정말 수정하시겠습니까?")) {
			return true;
		}		
		return false;
	}
	
	function fnReset() {
		if(confirm("정말 기존 정보로 복구하시겠습니까?")) {
			return true;
		}
		return false;
	}
</script>
</head>
<body>
	<fieldset>
		<legend>도서 정보 수정</legend>
		<form action="bookUpdate.jsp" method="get" onsubmit="return fnUpdate()" onreset="return fnReset()">
		<input type="hidden" name="isbn" value="<%=dto.getIsbn() %>"/>
			<table border="1">
				<tr>
					<td class="attribute">도서명</td>
					<td><input type="text" name="title" required="required" class="inputData" value="<%=dto.getTitle() %>" /></td>
				</tr>
				<tr>
					<td class="attribute">저&nbsp;&nbsp;&nbsp;자</td>
					<td><input type="text" name="auth" required="required" class="inputData" value="<%=dto.getAuth() %>" /></td>
				</tr>
				<tr>
					<td style="letter-spacing: 3px" class="attribute">ISBN</td>
					<td><input type="text" name="isbn_fake" required="required" class="inputData2" disabled="disabled" value="<%=dto.getIsbn() %>" /></td>
				</tr>
				<tr>
					<td class="attribute">출판사</td>
					<td><input type="text" name="comp" required="required" class="inputData" value="<%=dto.getComp() %>" /></td>
				</tr>
				<tr>
					<td class="attribute">단&nbsp;&nbsp;&nbsp;가</td>
					<td><input type="number" name="cost" required="required" class="inputData" value="<%=dto.getCost() %>" /></td>
				</tr>
				<tr>
					<td class="attribute">수&nbsp;&nbsp;&nbsp;량</td>
					<td><input type="number" name="su" required="required" class="inputData" value="<%=dto.getSu() %>" /></td>
				</tr>
				<tr >
					<td colspan="3">
						<input type="submit" value="도서 정보 수정" id="submit" />
						<input type="reset" value="기존 정보 복구" id="cancel"/>
						<input type="button" value="도서 목록 조회" onclick="location.href='bookSearchAll.jsp'"/>
					</td>
				</tr>
			</table>
		</form>
	</fieldset>
</body>
</html>