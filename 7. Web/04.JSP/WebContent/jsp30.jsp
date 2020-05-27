<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 30</title>
</head>
<body>
<!-- JSTL core 변수를 선언한 후 jsp31.jsp로 넘기자 : forward() -->
<c:set var="code" value="abc001" scope="request" />
<c:set var="name" value="컴퓨터" scope="request" />
<c:set var="price" value="5000000" />
<jsp:forward page="jsp31.jsp" />
</body>
</html>