<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int num1 = 1;
int num2 = 100;
int sum = getSum(num1, num2);
%>

<%!
public int getSum(int num1, int num2) {
	int sum = 0;
	for(int i = num1; i <= num2; i++) {
		sum += i;
	}
	return sum;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP01</title>
</head>
<body>
<%-- jSP 주석 --%>
<!-- HTML 주석 -->
두 수 사이의 누적합 : <%= sum %>

</body>
</html>