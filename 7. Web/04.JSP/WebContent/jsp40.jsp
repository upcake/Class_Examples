<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 40</title>
</head>
<body>
<c:set var="hi" value="   How   Are   You?   "/>
○ 원래 문자열(공백 제거) : ${hi }<br />
○ 문자열(공백 포함) : How&nbsp;&nbsp;&nbsp;Are&nbsp;&nbsp;&nbsp;You?<br />
<!-- 띄어쓰기를 안해야 자동완성 지원 됨 -->
○ 모두 대문자로 출력 : ${fn:toUpperCase(hi) }<br /> <!-- HOW ARE YOU? --> 
○ 모두 소문자로 출력 : ${fn:toLowerCase(hi) }<br /> <!-- how are you? -->
○ 문자열의 길이 : ${fn:length(hi) }<br /> <!-- 22 -->
○ 공백을 제거하여 출력 : ${fn:trim(hi) }<br /> <!-- How are you? -->
○ 공백을 제거한 후 문자열의 길이 : ${fn:length(fn:trim(hi)) }<br/> <!-- 16 --> <!-- 좌우 공백만 제거해서 16개 -->
○ Are 문자의 위치 : ${fn:indexOf(hi, "Are") }<br /> <!-- 9 -->
○ Are를 Were로 변경(치환) : ${fn:replace(hi, "Are", "Were") }<br /> <!-- How Were You? -->

</body>
</html>