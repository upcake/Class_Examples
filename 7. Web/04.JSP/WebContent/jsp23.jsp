<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 23</title>
</head>
<body>
	<form action="jsp24.jsp" method="post">
		이름 : <input type="text" name="irum" required="required" /><br />
		<br />
		다음 중 회원님께서 키우고 싶은 애완동물을 선택하세요.<br />
		<input type="checkbox" name="animal" value="강아지" />강아지<br />
		<input type="checkbox" name="animal" value="알파카" />알파카<br />
		<input type="checkbox" name="animal" value="토끼" />토끼<br />
		<input type="checkbox" name="animal" value="고슴도치" />고슴도치<br />
		<input type="checkbox" name="animal" value="금붕어" />금붕어<br />
		<input type="checkbox" name="animal" value="고양이" />고양이<br />
		<input type="submit" value="전송하기" />
	</form>
</body>
</html>