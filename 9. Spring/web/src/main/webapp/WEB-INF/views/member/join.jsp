<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join jsp</title>
</head>
<body>
<h3>회원가입 화면</h3>
<form action="joinRequest" method="post" > <!-- action 값을 안주면 submit을 자기 자신에게 한다 -->
	<table border='1'>
		<tr>
			<th>성명</th>
			<td><input type="text" name="name" /></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><input type="radio" name="gender" value="남" checked />남
				<input type="radio" name="gender" value="여" />여
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" /></td>
		</tr>
	</table><br />
	<input type="submit" value="HttpServletRequest" />
	<input type="submit" value="@RequestParam" onclick="action='joinRequestParam'" />
	<!-- onclick 이벤트로 액션 속성을 바꿔준다. -->
	<input type="submit" value="데이터 객체" onclick="action='joinDataObject'" />
	<input type="submit" value="@PathVariable" onclick="go_submit( this.form )" />
</form>

<script type="text/javascript">
function go_submit(f) {
	f.action = 'joinPathVariable/' + f.name.value
				 + '/' + f.gender.value
				 + '/' + f.email.value + '/'; 
}


</script>
</body>
</html>