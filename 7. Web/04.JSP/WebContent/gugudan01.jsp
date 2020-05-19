<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan JSP</title>
</head>
<body>
	[구구단 출력]<br />
	<table border="1">
		<tr bgcolor="silver">
			<%for(int i = 2; i <= 9; i++) { %>
				<th style="color: red;"><%=i %>단</th>
			<%} %>
		</tr>
		<%for(int i = 1; i <= 9; i++) { %>
			<tr>
			<%for(int j = 2; j <= 9; j++) { %>
				<%if (i % 2 == 1) { %>
					<%if (j * i >= 10) { %>  
						<td bgcolor="yellow"><%=j %> X <%=i %> = <%=i * j%></td>
					<%} else { %>
						<td bgcolor="yellow"><%=j %> X <%=i %> = 0<%=i * j%></td>
					<%} %>
				<%} else if (i % 2 == 0) { %>
					<%if (j * i >= 10) { %>  
						<td bgcolor="pink"><%=j %> X <%=i %> = <%=i * j%></td>
					<%} else { %>
						<td bgcolor="pink"><%=j %> X <%=i %> = 0<%=i * j%></td>
					<%} %>
				<%} %>
			<%} %>
			</tr>
		<%} %>
	</table>
</body>
</html>