<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new JSP</title>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<div id="content">
	<h3>신규 고객</h3>
	<form action="insert.cu" method="post">
		<table class='w-pct60'>
			<tr>
				<th class='w-px160'>성명</th>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="gender" value="남" checked/>남</label>
					<label><input type="radio" name="gender" value="여" />여</label>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" /></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" /></td>
			</tr>
		</table>
	</form>
	
	<div class="btnSet">
		<a class="btn-fill" onclick="$('form').submit()">저장</a>
		<a class="btn-empty" href="list.cu">취소</a>
	</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>