<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="dao" class="com.hanul.study.MemberDAO" /> --%>
<%
MemberDAO dao = new MemberDAO();
ArrayList<MemberDTO> list = dao.memberSearchAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP06</title>
<script type="text/javascript">
	function fnDel(id) {
//		alert("id : " + id); // 함수가 제대로 작동하는지 확인
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href = "jsp07.jsp?id=" + id;
		}
		return false;
	}
</script>
</head>
<body>
	<div align="center">
		[전체 회원 목록 조회]<br />
		<table border="1">
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>나이</th>
				<th>주소</th>
				<th>전화번호</th>
				<th colspan="4">삭제</th>
				<!-- 삭제 방법 -->
				<!-- 1 : 앵커 -->
				<!-- 2 : 버튼 -->
				<!-- 3 : 함수 -->
				<!-- 4 : input type 버튼 + 함수 -->
				<th>수정</th>
			</tr>
			<%for (MemberDTO dto : list) { %>
				<tr align="center">
					<td><%=dto.getIrum() %></td>
					<td><%=dto.getId() %></td>
					<td><%=dto.getPw() %></td>
					<td><%=dto.getAge() %></td>
					<td><%=dto.getAddr() %></td>
					<td><%=dto.getTel() %></td>
					<td><a href="jsp07.jsp?id=<%=dto.getId() %>">삭제1</a></td>
					<td><button onclick="location.href='jsp07.jsp?id=<%=dto.getId() %>'">삭제2</button></td>
					<!-- 삭제1과 삭제2는 확인창 없이 삭제가 바로 되므로 실수로 삭제할 수도 있다는 단점이 있다. -->
					<td><button onclick="fnDel('<%=dto.getId() %>')">삭제3</button></td>
					<!-- fnDel() 매개 변수를 반드시 작은 따옴표나 큰 따옴표로 묶어준다.-->
					<!-- 묶지 않으면 문자로 된 id는 작동이 안된다.  -->
					<!-- button 태그는 form 내에서 submit 역할을 한다는 단점이 있다. -->
					<td><input type="button" value="삭제4" onclick="fnDel('<%=dto.getId() %>')" /></td>
					<td><input type="button" value="수정" onclick="location.href='jsp08.jsp?id=<%=dto.getId() %>'" /></td>
				</tr>
			<%} %>
			<tr align="center">
				<td colspan="11">
					<input type="button" value="회원가입" onclick="location.href='jsp05Main.html'" />
				</td>			
			</tr>
		</table>
	</div>
</body>
</html>