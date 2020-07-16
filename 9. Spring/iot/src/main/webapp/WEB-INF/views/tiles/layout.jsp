<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> <!-- 타일을 사용하기 위한 라이브러리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${category eq 'cu' ? '고객 관리' : (category eq 'no' ? '공지사항' : (category eq 'bo' ? '방명록' : (category eq 'da' ? '공공 데이터' : (category eq 'join' ? '회원가입' : '') ) ) ) } ${empty category ? '' : ' : ' }IoT</title>
<!-- 브라우저 탭의 작은 아이콘 설정 -->
<link rel="icon" type="image/x-icon" href="img/icon.ico" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script>
<!-- cdnjs.com에서 가져온 fontawesome cdn 라이브러리 -->
<!-- 모든 화면에서 사용하기 위해 join.jsp에 있던 코드를 layout.jsp로 옮겨온다. -->
</head>
<body>
<!-- 각 jsp 파일의 인클루드 단을 없애도 된다. -->
<tiles:insertAttribute name="header" />

<!-- 각 jsp 파일의 div id="content" 부분을 없애도 된다. -->
<div id="content">
	<tiles:insertAttribute name="content" />
</div>

<tiles:insertAttribute name="footer" />
</body>
</html>