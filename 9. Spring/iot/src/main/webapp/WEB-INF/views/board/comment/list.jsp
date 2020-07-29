<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<core:forEach items="${list }" var="vo" varStatus="status"> 
	<!-- varStatus 인덱스값 찾아갈때 사용하는 속성 -->
	${status.index eq 0 ? '<hr>' : '' }
	<div data-id="${vo.id }"> <!-- data-* 속성 : 특별한 조작 없이 HTML 요소에 추가 정보를 저장할 수 있게 해주는 속성 -->
		${vo.name } [${vo.writedate }]
		<core:if test="${login_info.id eq vo.writer }"><!-- 로그인한 사용자가 작성한 댓글 수정/삭제 기능 -->
			<span style="float:right;">
				<a class="btn-fill-s btn-modify-save">수정</a>
				<a class="btn-fill-s btn-delete-cancel">삭제</a>
			</span>
		</core:if>
		<div class="original">${fn:replace(fn:replace(vo.content, lf, '<br>' ), crlf, '<br>') }</div>
		<div class="modify" style="display:none; margin-top:6px;"></div>
	</div>
	<hr>
</core:forEach>
<script>
/* closest()
 현재 element 에서 탐색 출발
 DOM 트리에서 selector 에 매칭되는 하나의 element 를 찾을 때까지 위로 탐색
 반환된 jQuery 객체는 0개 또는 1개의 element 를 포함한다.
*/

/*
$('.original').each(function(){
	$(this).text(
		$(this).text().replace(/</g, '$lt;').replace(/>/g, '$gt;')
			.replace(/&lt;br&gt;/g, '<br>')
	);
});
*/

//수정 / 저장 버튼 클릭
$('.btn-modify-save').on('click', function(){
	var $div = $(this).closest('div');

	if( $(this).text() == '수정' ) {
		//수정 텍스트 창 크기 고정
		$div.children('.modify').css('height', $div.children('.original').height()-6); 

		//줄바꿈 태그 변환
		var tag = "<textarea style='width:99%; height:90%; resize:none'>" + $div.children('.original').html().replace(/<br>/g, '\n') + "</textarea>";
		$div.children('.modify').html(tag);
		display($div, 'm');
	} else {
		var comment = {id:$div.data('id'),
						 content:$div.children('.modify').find('textarea').val() };
		//alert(JSON.stringify(comment)); JSON형태로 잘 출력되는지 확인
		
		$.ajax({
			url: 'board/comment/update',
			data: JSON.stringify(comment),
			contentType: 'application/json',
			type: 'post',
			success: function(data) {
				alert(data);
				comment_list();
			}, error: function(req, text) {
				alert(text + ':' + req.status);
			}
		});
	}
});

//삭제 / 취소 버튼 클릭
$('.btn-delete-cancel').on('click', function(){
	var $div = $(this).closest('div');

	if( $(this).text() == '취소' ) {
		display($div, 'd');
	} else {
		if( confirm('정말 삭제하시겠습니까?') ) {
			$.ajax({
				url: 'board/comment/delete/' + $div.data('id'),
				success: function() {
					comment_list();
				}, error: function(req, text) {
					alert(text + ':' + req.status);
				},
			});
		}
	}
})

function display(div, mode) {
	//수정 상태(m) : 저장/취소, 원글 안 보이고, 수정 글은 보이고 
	//보기 상태(d) : 수정/삭제, 원글 보이고, 수정 글은 안 보이고
	div.find('.btn-modify-save').text(mode=='m' ? '저장' : '수정');
	div.find('.btn-delete-cancel').text(mode=='m' ? '취소' : '삭제');
	div.children('.original').css('display', mode=='m' ? 'none' : 'block');
	div.children('.modify').css('display', mode=='m' ? 'block' : 'none');
}
</script>