<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info JSP</title>
</head>
<body>
<h3>회원가입 결과 - ${method }</h3>

성명 : ${name }<br />
성별 : ${gender }<br />
이메일 : ${email }<br /><br>
<hr>
성명 : ${vo.name }<br />
성별 : ${vo.gender }<br />
이메일 : ${vo.email }<br /><br>

<a href="<c:url value='/'/>join">회원가입 화면으로</a>
</body>
</html>