<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Insert Form</title>
<script type="text/javascript">
function fnSubmit() {
	if(confirm("작성하신 글을 등록하시겠습니까?")) {
		return true;
	}
	return false;
}

function fnReset() {
	if(confirm("입력하신 내용을 삭제하시겠습니까?")) {
		fnLoad();
		return true;
	}
	return false;
}

function fnLoad() {
	//폼에 name 속성을 줘서 폼 - 텍스트창으로 접근한다
	document.regForm.b_writer.focus();
}
</script>
</head>
<body onload="fnLoad()"><!-- 입력칸에 자동으로 포커스가 오게끔 설정 -->
<div align="center">
	<h3>[게시판 글쓰기]</h3>
	<form action="boardInsert.do" method="post" name="regForm" onsubmit="return fnSubmit()" onreset="return fnReset()">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="b_writer" maxlength="20" required="required" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="b_pwd" maxlength="20" required="required" />
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="b_subject" maxlength="50" required="required" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="10" cols="50" name="b_content" required="required"></textarea>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="등록" />
					<input type="reset" value="내용 삭제" />
					<input type="button" value="글 목록" onclick="location.href='boardList.do'" />
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>