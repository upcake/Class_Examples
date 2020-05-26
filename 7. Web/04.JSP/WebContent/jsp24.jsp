<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 24</title>
</head>
<body>
	<%
	String irum = request.getParameter("irum");
	out.println("[스크립틀릿]<br/>");
	out.println("회원님의 이름은 " + irum + "님 입니다.<br />");
	out.println(irum + "님께서 키우고 싶은 애완동물은 ");
	
	String[] animal = request.getParameterValues("animal");
	if(animal != null) {
		for(int i = 0; i < animal.length; i++) {
			if(i != animal.length - 1) {
				out.println(animal[i] + ", ");
			} else {
				out.println(animal[i] + "입니다.<br /><br />");
			}
		}
	} else {
		out.println("선택하신 사항이 없습니다.<br /><br />");
	}
	%>
	[EL 문법]<br />
	회원님의 이름은 ${param.irum }님입니다.<br />
	<br />
	${param.irum }님께서 키우고 싶은 애완동물은
		${paramValues.animal[0] }
		${paramValues.animal[1] }
		${paramValues.animal[2] }
		${paramValues.animal[3] }
		${paramValues.animal[4] }
		${paramValues.animal[5] }입니다.
</body>
</html>