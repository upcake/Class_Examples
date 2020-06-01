<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
MemberDAO dao = new MemberDAO();
List<MemberDTO> list = dao.memberSearchAll();
pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 목록 조회</title>
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
	<h3>전체 회원 목록 조회</h3>
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
		<!-- for문을 이용한 출력 -->
		<%--
			for(int i = 0; i < list.size(); i++) {
				out.println("<tr align='center'>");
					out.println("<td>" + list.get(i).getIrum() + "</td>");
					out.println("<td>" + list.get(i).getId() + "</td>");
					out.println("<td>" + list.get(i).getPw() + "</td>");
					out.println("<td>" + list.get(i).getAge() + "</td>");
					out.println("<td>" + list.get(i).getAddr() + "</td>");
					out.println("<td>" + list.get(i).getIrum() + "</td>");
				out.println("</tr>");
			}
		--%>
		<!-- ---------------------------------------------------------------------------------------- -->
		<!-- 향상된 for문을 이용한 출력 -->
		<%--
			for(MemberDTO dto : list) {
				out.println("<tr align='center'>");
				out.println("<td>" + dto.getIrum() + "</td>");
				out.println("<td>" + dto.getId() + "</td>");
				out.println("<td>" + dto.getPw() + "</td>");
				out.println("<td>" + dto.getAge() + "</td>");
				out.println("<td>" + dto.getAddr() + "</td>");
				out.println("<td>" + dto.getTel() + "</td>");
				out.println("</tr>");
			}
		--%>
		<!-- ---------------------------------------------------------------------------------------- -->
		<!-- JSTL을 이용한 출력 -->
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
				<form action="memberSearch.jsp" method="post"> 
					<select name="part">
						<option value="irum">이름</option>
						<option value="id">아이디</option>
						<option value="addr">주소</option>
						<option value="tel">전화번호</option>
					</select>
					<input type="text" name="searchData" required="required" />
					<input type="submit" value="검색하기" />
					<input type="button" value="회원가입" onclick="location.href='MemberMain.html'"/>
				</form>
			</td>
		</tr>
	</table>
</div>
</body>
</html>