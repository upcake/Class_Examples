<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num1 = Integer.parseInt(request.getParameter("num1"));
int num2 = Integer.parseInt(request.getParameter("num2"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP25</title>
</head>
<body>
<!-- jsp25.jsp?num1=20&num2=10 -->
num1의 값(JSP) : <%=num1 %><br />
num2의 값(JSP) : <%=num2 %><br />
<br />
num1의 값(EL) : ${param.num1 }<br /> <!-- ${num1 }은 바인딩 객체가 없어서 출력되지 않는다. -->
num2의 값(EL) : ${param.num2 }<br /> <!-- request.getParameter()로 가져온 객체가 없어도 출력된다 -->
num1 + num2(잘못된 코드) : ${param.num1 } + ${param.num2 }<br />
<br />
[사칙 연산]<br />
num1 + num2 : ${param.num1 + param.num2 }<br />
num1 - num2 : ${param.num1 - param.num2 }<br />
num1 * num2 : ${param.num1 * param.num2 }<br />
num1 / num2 : ${param.num1 / param.num2 }<br />
num1 % num2 : ${param.num1 % param.num2 }<br />
<br />
[비교 연산]<br />
num1이 더 큽니까? : ${param.num1 - param.num2 > 0 }<br />
num1이 더 큽니까? : ${param.num1 > param.num2 }<br />
num1이 더 큽니까? : ${param.num1 gt param.num2 }<br />
num1이 더 큽니까? : ${param.num1 gt param.num2 ? "예" : "아니요" }<br />
<br />
num1과 num2가 같습니까? : ${param.num1 == param.num2 }<br />
num1과 num2가 같습니까? : ${param.num1 eq param.num2 }<br />
<!-- 
> 	: gt
>= 	: ge
==	: eq
<=	: le
<	: lt
!=	: ne
 -->
</body>
</html>