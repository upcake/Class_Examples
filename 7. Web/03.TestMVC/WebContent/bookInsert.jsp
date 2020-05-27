<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="com.hanul.study.BookDTO">
	<jsp:setProperty property="*" name="dto"/>
</jsp:useBean>
<jsp:useBean id="dao" class="com.hanul.study.BookDAO" />
<% 
int succ = dao.insert2(dto);
if(succ > 0) {
	out.println("<script>alert('도서 정보 입력 성공!');");
	out.println("location.href='bookSearchAll.jsp'; </script>");
} else {
	out.println("<script>alert('도서 정보 입력 실패!');");
	out.println("location.href='bookSearchAll.jsp'; </script>");
}
%>