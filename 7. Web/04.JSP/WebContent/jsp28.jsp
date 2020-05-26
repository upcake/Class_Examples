<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
//Object 타입을 String[] 타입으로 캐스팅 해준다.
String[] studyJSP = (String[]) request.getAttribute("study");
ArrayList<String> listJSP = (ArrayList<String>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
[배열을 받는 방법(JSP) - ①]<br />
<%for(int i = 0; i < studyJSP.length; i++) { %>
	studyJSP[] 배열의 <%=i %>번지(인덱스) 값 : <%=studyJSP[i] %><br />
<%} %>
<br />
[배열을 받는 방법(JSP) - ②]<br />
<%for(int i = 0; i < studyJSP.length; i++) {
	out.println("studyJSP[] 배열의 " + i + "번지(인덱스) 값 : " + studyJSP[i] + "<br />");
}%>
<br />
[배열을 받는 방법(EL)]<br />
<!-- study[]을 페이지에 작성하진 않았지만, 27에서 넘어온 study[]에 접근할 수 있다. -->
study[] 배열의 0번지(인덱스) 값 : ${study[0] }<br />
study[] 배열의 1번지(인덱스) 값 : ${study[1] }<br />
study[] 배열의 2번지(인덱스) 값 : ${study[2] }<br />
study[] 배열의 3번지(인덱스) 값 : ${study[3] }<br />
study[] 배열의 4번지(인덱스) 값 : ${study[4] }<br />
study[] 배열의 5번지(인덱스) 값 : ${study[5] }<br />
study[] 배열의 6번지(인덱스) 값 : ${study[6] }<br />
<br /><hr><br />
[리스트를 받는 방법(JSP)]<br />
<%
for(int i = 0; i < listJSP.size(); i++) {
	out.println("ArrayList 배열의 " + i + "번지 값 : " + listJSP.get(i) + "<br />");
}
%>
<br />
[리스트를 받는 방법(EL)]<br />
ArrayList 배열의 0번지 값 : ${list[0] }<br />
ArrayList 배열의 1번지 값 : ${list[1] }<br />
ArrayList 배열의 2번지 값 : ${list[2] }<br />
ArrayList 배열의 3번지 값 : ${list[3] }<br />
ArrayList 배열의 4번지 값 : ${list[4] }<br />
<br /><hr><br />

[바인딩 객체(dto)를 받는 방법(EL)]<br />
이름 : ${dto.irum }<br />
아이디 : ${dto.id }<br />
비밀번호 : ${dto.pw }<br />
나이 : ${dto.age }<br />
주소 : ${dto.addr }<br />
전화번호 : ${dto.tel }<br />
<br /><hr><br />

[리스크 구조에 객체가 저장된 객체 배열을 받는 방법]<br />
mlist 0번지 값 : ${mlist[0].irum }, ${mlist[0].id }, ${mlist[0].pw },
					 ${mlist[0].age }, ${mlist[0].addr }, ${mlist[0].tel }<br />
mlist 4번지 값 : ${mlist[4].irum }, ${mlist[4].id }, ${mlist[4].pw }, ${mlist[4].age }, ${mlist[4].addr }, ${mlist[4].tel }<br />
</body>
</html>