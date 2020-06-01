<%@page import="java.util.List"%>
<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
String part = request.getParameter("part");
String searchData = request.getParameter("searchData");
//System.out.println(part);
//System.out.println(searchData);

MemberDAO dao = new MemberDAO();
List<MemberDTO> list = dao.memberSearch(part, searchData);
pageContext.setAttribute("list", list);	//바인딩 객체
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberSearch</title>
<script type="text/javascript">
function fnDelete(id){
	//alert("id : " + id);
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href="memberDelete.jsp?id=" + id;
		//Get 방식으로 정보를 넘길때 띄어쓰기 안하게 주의할 것
	}
}
</script>
</head>
<body>
<div align="center">
	<h3>검색 결과 보기</h3>
	<table border="1" width="80%">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>나이</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
		<%if(list.size() == 0) { //검색 결과가 없으면%>
			<tr align="center">
				<td colspan="8">검색 결과가 없습니다.</td>
			</tr>
		<%} %>
		<c:forEach var="i" items="${list }">
			<tr align="center">
				<td>${i.irum }</td>
				<td>${i.id }</td>
				<td>${i.pw }</td>
				<td>${i.age }</td>
				<td>${i.addr }</td>
				<td>${i.tel }</td>
				<td><input type="button" value="삭제" onclick="fnDelete('${i.id }')"/></td>
				<!-- id값을 넘길때 따옴표로 묶어줘야 문자를 입력해도 오류가 안난다. -->
				<td><input type="button" value="수정" onclick="location.href='memberDetail.jsp?id=${i.id}'"/></td>
			</tr>
		</c:forEach>
		<tr align="center">
			<td colspan="8">
				<input type="button" value="전체 회원 목록 보기" onclick="location.href='memberList.jsp'" />
				<input type="button" value="회원가입" onclick="location.href='MemberMain.html'"/>
			</td>
		</tr>
	</table>
</div>
</body>
</html>