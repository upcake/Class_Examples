<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list JSP</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<div id="content">
	<h3>고객 목록</h3>
	<table>
		<tr>
			<th>번호</th>
			<th>고객명</th>
			<th>전화번호</th>
		</tr>
		<tr>
			<td>데이터1</td>
			<td>데이터2</td>
			<td>데이터3</td>
		</tr>
	</table>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>