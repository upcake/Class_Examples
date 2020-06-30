<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 스프링은 따로 라이브러리를 설치하지 않아도 다운 받을 라이브러리를 설정할 수 있다. -->
<!-- 그 중에 jstl 라이브러리도 있기 때문에 사용할 수 있는것 -->
<!-- 라이브러리 목록은 iot/pom.xml, c:\사용자\.m2에서 확인가능 -->

<link rel="stylesheet" type="text/css" href="css/common.css">
<!-- rel : 형태는 스타일 시트, 타입은 텍스트로된 css -->
<style>
header ul, header ul li {
	margin: 0;
	padding: 0;
	display: inline;
}

header .category {
	font-size: 18px;
}

header .category ul li:not(:first-child) { /* 첫번째 li만 빼고 지정 */
	padding-left: 30px;
}

header .category ul li a:hover, header .category ul li a.active {
	font-weight: bold;
	color: #0000cd;
}

</style>
<header style="border-bottom: 1px solid #ccc; padding: 15px 0; text-align: left">
	<div class="category" style="margin-left: 100px;"> 
		<ul>
			<li><a href="<core:url value='/' />"><img src="img/logo.png" /></a></li>
			<li><a href='list.cu' ${category eq 'cu' ? "class='active'" : '' } >고객 관리</a></li>
			<li><a href='list.no'>공지사항</a></li>
			<li><a href='list.bo'>방명록</a></li>
			<li><a href='list.da'>공공 데이터</a></li>
		</ul>
	</div>
</header>