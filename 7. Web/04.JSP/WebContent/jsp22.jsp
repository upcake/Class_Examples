<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//jsp21.jsp에서 넘겨준 바인딩 객체(sum)를 받는다.
//int sum = (int) request.getAttribute("sum");

//바인딩(연결) 객체는 Object Type → 클래스 타입으로 받는다 : Casting 필수
Integer sum = (Integer) request.getAttribute("sum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 22</title>
</head>
<body>
○ 1부터 100까지의 누적합(JSP) : <%=sum %><br />
○ 1부터 100까지의 누적합(EL) : ${sum }
</body>
</html>