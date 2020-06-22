<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.board.study.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String id = (String) session.getAttribute("id"); //JSP는 session이 내장 객체라 바로 사용 가능하다.
MemberDAO dao = new MemberDAO();
String member_pw = dao.getMember_pw(id);
Integer nowPage = (Integer)request.getAttribute("page");
Integer maxPage = (Integer)request.getAttribute("maxPage");
Integer startPage = (Integer) request.getAttribute("startPage");
Integer endPage = (Integer) request.getAttribute("endPage");
Integer listCount = (Integer) request.getAttribute("listCount");
ArrayList<BoardDTO> list = new ArrayList<>();
list = (ArrayList<BoardDTO>)request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board list JSP</title>
<script type="text/javascript">
function fnModify(id, member_pw) {
	//alert("id : " + id);
	var pw = prompt("비밀번호를 입력하세요","");
	//alert("member_pw : " + member_pw + "\npw : " + pw);
	//member_pw : dto에 저장되어있던 비밀번호
	//pw : 방금 사용자로부터 입력받은 비밀번호
	if(member_pw == pw) { //맞는 비밀번호를 입력하면 URL이 바뀐다
		//alert("비밀번호 일치합니다.")
		location.href = "memberDetailAction.me?member_id=" + id;
	} else {
		alert("비밀번호가 일치하지 않습니다.");
	}
}
</script>
</head>
<body>
<div align="center">
	<h3>[자유 게시판]</h3>
	<table border= "1">
		<tr align="center";>
			<th>번호</th>
			<th width="200">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%for(int i = 0; i < list.size(); i++) { 
			BoardDTO dto = list.get(i);%>
			<tr align="center">
				<td><%=dto.getBoard_num() %></td>
				<td><a href="boardDetailAction.bo?board_num=<%=dto.getBoard_num() %>"><%=dto.getBoard_subject() %></a></td>
				<td><%=dto.getBoard_id() %></td>
				<td><%=dto.getBoard_date().substring(0, 10) %></td>
				<td><%=dto.getBoard_readcount() %></td>
							
			</tr>
		<%} %>
	
		<tr align="center">
			<td colspan="5">
				<%if(nowPage <= 1) { %>
					[이전]&nbsp;
				<%} else { %>
					<a href="boardList.bo?page=<%=nowPage - 1 %>">[이전]</a>&nbsp;
				<%} %>
				
				<%for(int i = startPage; i <= endPage; i++) { %>
					<%if(i == nowPage) { %>
						[<%=i %>]&nbsp;
					<%} else { %>
						<a href="boardList.bo?page=<%=i %>">[<%=i %>]</a>&nbsp;
					<%} %>
				<%} %>
				
				<%if(nowPage >= maxPage) { %>
					[다음]&nbsp;
				<%} else { %>
					<a href="boardList.bo?page=<%=nowPage + 1 %>">[다음]</a>&nbsp;
				<%} %>
			</td>
		</tr>
	
		<tr align="center">
			<td colspan="5">
				<%if(id != null && id.equals("admin")) { %>
					<input type="button" value="회원 관리" onclick="location.href='memberListAction.me'" />
				<%} %>
				<input type="button" value="로그아웃" onclick="location.href='memberLogout.me'"/>
				<input type="button" value="글쓰기" onclick="location.href='boardWrite.bo'" />
				<input type="button" value="회원 정보 수정" onclick="fnModify('<%=id%>', '<%=member_pw %>')"/>
			</td>
		</tr>
	</table>
</div>
</body>
</html>