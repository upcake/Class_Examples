<%@page import="com.hanul.study.SumMachine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
○ Servlet(Controller)의 역할
	- 클라이언트의 요청을 받는다 : jsp03Main.html에서 전달한 매개 변수 num1과 num2를 가져온다.
	- 비즈니스 로직 : SumMachine Class의 getSum() 메서드를 호출하고 결과를 리턴 받는다.
	- 프레젠테이션 로직 : 결괏값을 출력 ▶ jsp04.jsp 넘겨서 출력 : request.forward()
 -->
<%
int num1 = Integer.parseInt(request.getParameter("num1"));
int num2 = Integer.parseInt(request.getParameter("num2"));

SumMachine sm = new SumMachine();
int sum = sm.getSum(num1, num2);

request.setAttribute("num1", num1); //바인딩(연결) 객체
request.setAttribute("num2", num2);
request.setAttribute("sum", sum);
RequestDispatcher rd = request.getRequestDispatcher("jsp04.jsp");	//페이지 호출
rd.forward(request, response);	//페이지 전환
%>