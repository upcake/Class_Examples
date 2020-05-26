<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 16</title>
<script type="text/javascript">
	function fnTime() {
		var date = new Date();
//		alert(date); // Thu May 21 2020 16:35:11 GMT+0900 (대한민국 표준시) → 오후 04시 34분 31초
		
		var hour = date.getHours();		// 현재 시간의 시 : 16
		var minute = date.getMinutes();	// 현재 시간의 분 : 35
		var second = date.getSeconds();	// 현재 시간의 초 : 11
//		alert(hour + "시 " + minute + "분 " + second + "초");

		var setTime = hour > 12 ? "오후 " : "오전 ";
		setTime += (hour > 12 ? hour - 12 : hour) + "시 ";
		setTime += (minute < 10 ? "0" + minute : minute) + "분 ";
		setTime += (second < 10 ? "0" + second : second) + "초";
//		alert(setTime);

		document.getElementById("time").innerHTML = setTime;
		setTimeout("fnTime()", 1000);
	}
</script>
</head>
<body onload="fnTime()">
<div align="center" id="time">현재 시간</div>
	<div align="center">
		<table border="1">
			<tr align="center">
				<td colspan="2" height="150">회사 로고 / 네비게이션 메뉴</td>
			</tr>
			<tr align="center"> 
				<td height="300" width="30%">로그인이 들어갈 부분</td>
				<td width="70%">본문 영역(Content)이 들어갈 부분</td>
			</tr>
			<tr align="center">
				<td colspan="2"> 
					<!-- 날짜와 시간이 들어갈 부분(jsp15.jsp) -->
					<%@ include file="jsp15.jsp" %><br />	<!-- 정적 -->
					<jsp:include page="jsp15.jsp"></jsp:include> <!-- 동적 -->
				</td>
			</tr>
		</table>
	</div>
</body>
</html>