<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
//MemberDTO dto = (MemberDTO) pageContext.getAttribute("dto"); // request scope로 넘어왔으므로 request로 받는다.
MemberDTO dto = (MemberDTO) request.getAttribute("dto");
%>

<!-- dto 객체를 jsp19.jsp로 넘기자 -->
<%
request.setAttribute("dto", dto);

//자바 코드로 바인딩 객체 넘기면서 페이지 이동
//RequestDispatcher rd = request.getRequestDispatcher("jsp19.jsp");
//rd.forward(request, response);
%>
<jsp:forward page="jsp19.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
○ 이름(JSP, dto) : <%=dto.getIrum() %><br />
</body>
</html>