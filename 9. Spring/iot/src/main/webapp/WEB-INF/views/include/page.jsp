<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<div class="page_list">
	<core:if test="${page.curBlock gt 1 }">
		<a class="page_first" onclick="go_page(1)">처음</a>
		<a class="page_prev" onclick="go_page(${page.beginPage - page.blockPage })">이전</a>
	</core:if>

	<!-- step : 지정하지 않아도 디폴트 1 -->
	<core:forEach var="no" begin="${page.beginPage }" end="${page.endPage }" step="1">
		<core:if test="${no eq page.curPage}">
			<span class="page_on">${no }</span>
		</core:if>
		
		<core:if test="${no ne page.curPage }">
			<a class="page_off" onclick="go_page(${no })">${no }</a>
		</core:if>
	</core:forEach>
	
	<core:if test="${page.curBlock lt page.totalBlock }">
		<a class="page_next" onclick="go_page(${page.endPage + 1 })">다음</a>
		<a class="page_last" onclick="go_page(${page.totalPage })">마지막</a>
	</core:if>
</div>

<style>
.page_on, .page_off, .page_next, .page_last, .page_first, .page_prev {
	display: inline-block;
	line-height: 30px;
	margin: 0;		
}

.page_on, .page_off {
	min-width:22px;
	padding: 0 5px 2px;
}

.page_next, .page_last, .page_first, .page_prev {
	text-indent: -99999999px;
	border: 1px solid #d0d0d0;
	width: 30px;
}

.page_on {
	border: 1px solid gray;
	background-color: gray;
	color:#FFF;
	font-weight: bold;
}

.page_next { background: url("img/page_next.jpg") center no-repeat; }
.page_last { background: url("img/page_last.jpg") center no-repeat; }
.page_prev { background: url("img/page_prev.jpg") center no-repeat; }
.page_first { background: url("img/page_first.jpg") center no-repeat; }

</style>

<script>
function go_page(no) {
	$('[name=curPage]').val(no);
	$('[name=keyword]').val('${page.keyword}');
	$('#list').submit();
}
</script>