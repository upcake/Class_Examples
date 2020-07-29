<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board list jsp</title>
<style type="text/css">
table { table-layout:fixed; }
table td { overflow:hidden; text-overflow:ellipsis; white-space:nowrap; }
.grid li div span{ float: right; }
</style>
</head>
<body>
<h3>방명록</h3>
<form id="list" method="post" action="">
	<input type="hidden" name="curPage" value="1" />
	<input type="hidden" name="id" />
	<div id="list-top">
		<div>
			<!-- 검색 -->
			<ul>
				<li>
					<select name="search" class="w-px80">
						<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
						<option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
						<option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
						<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
					</select>
				</li>
				<li>
					<input type="text" name="keyword" class="w-px300"/>
				</li>
				<li>
					<a class="btn-fill" onclick="$('form').submit()">검색</a>
				</li>
			</ul>
			
			<ul>
				<li>
					<select name="pageList" class="w-px80" onchange="$('[name=curPage]').val(1); $('form').submit()">
						<option value="10" ${page.pageList eq 10 ? 'selected' : '' }>10개씩</option>
						<option value="20" ${page.pageList eq 20 ? 'selected' : '' }>20개씩</option>
						<option value="30" ${page.pageList eq 30 ? 'selected' : '' }>30개씩</option>
					</select>
				</li>
				<li>
					<select name="viewType" class="w-px100" onchange="$('form').submit()">
						<option value="list" ${page.viewType eq 'list' ? 'selected' : '' }>리스트 형태</option>
						<option value="grid" ${page.viewType eq 'grid' ? 'selected' : '' }>바둑판 형태</option>
					</select>
				</li>
				<!-- 로그인되어 있으면 글쓰기 가능 -->
				<core:if test="${!empty login_info }">
					<li>
						<!-- 글쓰기 버튼 -->
						<a class="btn-fill" href="new.bo">글쓰기</a>
					</li>
				</core:if>			
			</ul>
		</div>
	</div>
</form>

<div id="data-list">
	<core:if test="${page.viewType eq 'list' }">
		<table>
			<tr>
				<th class="w-px60">번호</th>
				<th>제목</th>
				<th class="w-px100">작성자</th>
				<th class="w-px120">작성일자</th>
				<th class="w-px60">첨부 파일</th>
			</tr>
			<core:forEach items="${page.list }" var="vo">
				<tr>
					<td>${vo.no }</td>
					<td class="left"><a onclick="go_detail(${vo.id})">${vo.title }</a></td>
					<td>${vo.name }</td>
					<td>${vo.writedate }</td>
					<td>
						<core:if test="${!empty vo.filename }">
							<img src="img/attach.png" class="file-img"/>
						</core:if>
					</td>
				</tr>
			</core:forEach>
		</table>
	</core:if>
	
	<core:if test="${page.viewType eq 'grid' }">
		<ul class="grid">
			<core:forEach items="${page.list }" var="vo">
				<li>
					<div><a onclick="go_detail(${vo.id})">${vo.title }</a></div>
					<div>${vo.name }</div>
					<div>
						${vo.writedate }
						<span>${empty vo.filename ? '' : '<img src="img/attach.png" class="file-img" />' }</span>
					</div>
				</li>
			</core:forEach>
		</ul>
	</core:if>
</div>

<div class="btnSet">
	<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>
<script type="text/javascript">
$(function(){
	$('#data-list ul').css('height', 
			( ( $('.grid li').length % 5 > 0 ? 1 : 0 ) + Math.floor($('.grid li').length / 5) )
			 * $('.grid li').outerHeight(true) - 20);
})

function go_detail(id) {
	$('[name=id]').val(id);
	$('form').attr('action', 'detail.bo');
	$('form').submit();	
}
</script>
</body>
</html>