<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list JSP</title>
</head>
<body>
<h3>공지사항</h3>
<form method="post" action="list.no" id="list">
	<input type="hidden" name="curPage" value="1"/>
	
	<div id="list-top">
		<div>
			<ul>
				<core:if test="${login_info.admin eq 'Y' }">
					<li><a class="btn-fill" href="new.no">글쓰기</a></li>
				</core:if>
			</ul>
		</div>
	</div>
</form>

<table>
	<tr>
		<th class="w-px60">번호</th>
		<th>제목</th>
		<th class="w-px100">작성자</th>
		<th class="w-px120">작성일자</th>
		<th class="w-px60">첨부파일</th>
	</tr>
	<core:forEach items="${page.list }" var="vo">
		<tr>
			<td>${vo.no }</td>
			<td class="left"><a href="detail.no?id=${vo.id }" >${vo.title }</a></td>
			<td>${vo.name }</td>
			<td>${vo.writedate }</td>
			<td>
				<core:if test="${!empty vo.filename }">
					<a href="download.no?id=${vo.id }">
						<img title="${vo.filename }" class="file-img" src="img/attach.png" />
					</a>
				</core:if>
			</td>
		</tr>
	</core:forEach>
</table>
<div class="btnSet">
	<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>
</body>
</html>