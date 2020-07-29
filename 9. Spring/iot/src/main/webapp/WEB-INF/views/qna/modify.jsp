<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna modify jsp</title>
</head>
<body>
<h3>QNA 수정</h3>
<!-- 
파일 첨부 시 form 태그의 필수 속성
1. method="post"
2. enctype="multipart/form-data"
 -->
<form action="update.qna" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${vo.id }"/>
	<input type="hidden" name="attach" />
	<table>
		<tr>
			<th class="w-px160">제목</th>
			<td><input type="text" class="need" name="title" value="${vo.title }"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="need" name="content">${vo.content }</textarea></td>
		</tr>
		<tr>
			<th>첨부 파일</th>
			<td class="left">
				<label>
					<input id="attach-file" type="file" name="file" />
					<img src="img/select.png" class="file-img" />
				</label>
				<span id="file-name">${vo.filename }</span>
				<span id="delete-file" style="display:${empty vo.filename ? 'none' : 'inline'}; color:red; margin-left:20px;"><i class="fas fa-times font-img"></i></span>
			</td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" onclick="if( necessary() ) { $('[name=attach]').val($('#file-name').text()); $('form').submit(); }">저장</a>
	<a class="btn-empty" href="detail.qna?id=${vo.id }">취소</a>
</div>

<script type="text/javascript" src="js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
</body>
</html>