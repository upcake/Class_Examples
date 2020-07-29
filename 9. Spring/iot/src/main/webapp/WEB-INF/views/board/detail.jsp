<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board detail jsp</title>
<style type="text/css">
table td { word-break:break-all; } /* 영문으로'만' 이루어진 글 줄바꿈 되게끔 처리 */

#popup { 
	width: 350px;
 	height: 350px; 
 	position:absolute; 
 	left:50%; 
 	top:15%; 
 	transform:translate(-50%);
 	border: 3px solid #666;
 	border-radius: 50%;
 	z-index: 9999999999;
 	display: none;
}


#popup-background {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: #000;
	opacity: 0.3;
	display: none;
}

.popup{ width: 100%; height: 100%;}
#comment_regist span{ width:50%; float:left; }
</style>
</head>
<body>
<h3>방명록 상세 조회</h3>
<table>
	<tr>
		<th class="w-px160">제목</th>
		<td class="left" colspan="5" class="left">${vo.title }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${vo.name }</td>
		<th class="w-px100">작성일자</th>
		<td class="w-px100">${vo.writedate }</td>
		<th class="w-px80">조회수</th>
		<td class="w-px60">${vo.readcnt }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td class="left" colspan="5">${fn:replace(vo.content, crlf, '<br>') }</td>
	</tr>
	<tr>
		<th>첨부 파일</th>
		<td class="left" colspan="5">
			<core:if test="${!empty vo.filename }">
				${vo.filename }
				<span id="preview"></span>
				<a href="download.bo?id=${vo.id }"><i class="fas fa-download font-img"></i></a>
			</core:if>
		</td>
	</tr>
</table>
<div class="btnSet">
	<a class="btn-fill" onclick="go_list()">목록으로</a>
	<!-- 작성자로 로그인한 경우만 수정/삭제 가능, 관리자는 삭제 가능 -->
	<core:if test="${login_info.id eq vo.writer}"> 
		<a class="btn-fill" onclick="$('form').attr('action', 'modify.bo'); $('form').submit()">수정</a>
	</core:if>
	<core:if test="${login_info.id eq vo.writer or login_info.admin eq 'Y' }"> 
		<a class="btn-fill" onclick="if( confirm('정말 삭제?') ) { $('form').attr('action', 'delete.bo'); $('form').submit(); } ">삭제</a>
	</core:if>
</div>

<div style="margin:0 auto; padding-top:20px; width:500px;">
	<div id="comment_regist">
		<span class="left">댓글 작성</span>
		<span class="right"><a class="btn-fill-s" onclick="comment_regist()">등록</a></span>
		<textarea id="comment" style="width:99%; height:60px; margin-top:5px; resize:none;"></textarea>
	</div>
	<div id="comment_list" style="text-align:left"></div>
</div>


<form method="post" action="list.bo">
	<input type="hidden" name="id" value="${vo.id }" />
	<input type="hidden" name="curPage" value="${page.curPage }" />
	<input type="hidden" name="search" value="${page.search }" />
	<input type="hidden" name="keyword" value="${page.keyword }" />
	<input type="hidden" name="viewType" value="${page.viewType }" />
	<input type="hidden" name="pageList" value="${page.pageList }" />
</form>
<div id="popup" onclick ="$('#popup, #popup-background').css('display', 'none')"></div>
<div id="popup-background"></div>
<script type="text/javascript">
function go_list() {
	$('form').submit();
}

function showAttachImage(id) {
	//첨부된 파일이 이미지인 경우 보여지게
	var filename = '${vo.filename}';
	var ext = filename.substring( filename.lastIndexOf('.') + 1 ).toLowerCase(); //확장자
	var imgs = [ 'gif', 'jpg', 'jpeg', 'png', 'bmg' ];
	if( imgs.indexOf(ext) > -1 ) {
		var img = '<img src="' + '${vo.filepath}'.substring(1) + '" '
			+ 'id="preview-img" ' 
			+ 'class="' + (id == '#popup' ? 'popup' : 'file-img') + '" '
			+ 'style="border-radius: 50%"/>';
		$(id).html(img);
	}
}

if( ${!empty vo.filename} ) {
	showAttachImage('#preview');
}

$('#preview-img').click(function() {
	$('#popup, #popup-background').css('display', 'block');
	showAttachImage('#popup');
});

function comment_regist() {
	if(${empty login_info}) {
		alert("댓글을 등록하려면 로그인하세요!");
		return;	
	}
	
	if( $("#comment").val() == "" ) {
		alert("댓글을 입력하세요!");
		$("#comment").focus();
		return;
	}

	$.ajax({
		url: "board/comment/insert",
		data: { pid:${vo.id}, content: $("#comment").val() },
		success: function(data) {
				if(data) {
					$("#comment").val('');
					comment_list();
				}
		},
		error: function(req, text) {
			alert(text + " : " + req.status)
		}
	});
}

function comment_list() {
	$.ajax({
		url: 'board/comment/${vo.id}',
		success: function(data) {
			$("#comment_list").html(data);
		},
		error: function(req, text) {
			alert(text + ' : ' + req.status);
		}
		
	});
}
comment_list();
</script>
</body>
</html>