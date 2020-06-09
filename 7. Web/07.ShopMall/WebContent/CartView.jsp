<%@page import="java.text.DecimalFormat"%>
<%@page import="com.hanul.cart.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
ArrayList<CartDTO> cart = null;

Object obj = session.getAttribute("cart");	//세션 객체에서 cart 값을 가져온다.

if(obj == null) {	//세션 정보가 없으면 배열을 생성 : 주문한 제품이 없다
	cart = new ArrayList<CartDTO>();	
} else {			//세션 정보가 있으면 강제로 캐스팅 : 주문한 제품이 있다
	cart = (ArrayList<CartDTO>) obj;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart View</title>
<script type="text/javascript">
function fnPay(){
	alert("결제 API를 발급 받으시기 바랍니다.");
}

function fnClear(){
	if(confirm("장바구니를 비우시겠습니까?")) {
		location.href = "CartClear.jsp";	
	}
}

function fnGo(){
	location.href = "ShopMallMain.jsp";
}
</script>
</head>
<body>
<div align="center">
	<h3>[장바구니 보기]</h3>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>과일명</th>
			<th>단가</th>
			<th>주문 수량</th>
			<th>가격</th>
		</tr>
		<%
		if(cart.size() == 0) {
			out.println("<tr align='center'>");
				out.println("<td colspan= '5'>");
					out.println("장바구니에 담긴 상품이 없습니다.");
					out.println("<a href= 'ShopMallMain.jsp'>주문하기</a>");
				out.println("</td>");
			out.println("</tr>");
		} else {
			int totalSum = 0, total = 0;
			DecimalFormat df = new DecimalFormat("￦#,##0");
			for(int i = 0; i < cart.size(); i++) {
				CartDTO dto = cart.get(i);
				out.println("<tr align= 'center'>");
					out.println("<td>" + (i + 1) + "</td>");
					out.println("<td>" + dto.getName() + "</td>");
					out.println("<td>" + df.format(dto.getPrice()) + "</td>");
					out.println("<td>" + dto.getCnt() + "</td>");
					total = dto.getPrice() * dto.getCnt();
					out.println("<td>" + df.format(total) + "</td>");
				out.println("</tr>");
				totalSum += total;
			}
		out.println("<tr align = 'center'>");
			out.println("<td colspan= '4'>");
				out.println("<input type='button' value='결제하기' onclick='fnPay()' />");
				out.println("<input type='button' value='장바구니 비우기' onclick='fnClear()' />");
				out.println("<input type='button' value='쇼핑 계속하기' onclick='fnGo()' />");
			out.println("</td>");
			out.println("<td>");
			out.println(df.format(totalSum));
			out.println("</td>");
		out.println("</tr>");
		}//if else
		%>
	</table>
</div>
</body>
</html>