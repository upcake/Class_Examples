<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board new jsp</title>
</head>
<body>
<h3>방명록 글쓰기</h3>
<form action="insert.bo" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th class="w-px160">제목</th>
			<td><input type="text" name="title" class="need" title="제목"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${login_info.name }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" class="need" title="내용"></textarea></td>
		</tr>
		<tr>
			<th>첨부 파일</th>
			<td class="left">
				<label>
					<input type="file" name="file" id="attach-file" />
					<img src="img/select.png" class="file-img"/>
				</label>
				<span id="file-name"></span>
				<span id="preview"></span>
				<span id="delete-file" style="color:red; margin-left:20px;">
					<i class="fas fa-times font-img" ></i>
				</span>
			</td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" onclick="if( necessary() ){ $('form').submit() }">저장</a>
	<a class="btn-empty" href="list.bo">취소</a>
</div>
<script type="text/javascript">
function isImage(filename){
	//ab.txt, abc.png, abc.JPG, abcd.hwp, ...
	var ext = filename.substring(filename.lastIndexOf('.') + 1 ).toLowerCase(); // 마지막 점(.) 다음 위치에서부터 끝까지 뽑고 소문자로 변환
	var imgs = ['png', 'jpg', 'jpeg', 'gif', 'bmp'];
	if ( imgs.indexOf(ext) > -1 ) { return true; }
	else { return false; }
}

$('#attach-file').on('change', function() {
	var attach = this.files[0];
	if( attach ) {
		if( isImage(attach.name) ) {
			var img = "<img id='preview-img' class='file-img' src='' style='border-radius:50%'/>";
			$('#preview').html(img);

			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview-img').attr('src', e.target.result);
			}
			reader.readAsDataURL(attach);
		} else {
			$('#preview').html('')
		}
	}
});

$('#delete-file').on('click', function() {
	$('#preview').html('')
});
</script>
<script type="text/javascript" src="js/file_attach.js"></script>
<script type="text/javascript" src="js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
</body>
</html>