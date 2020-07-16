/**
 * 첨부파일 관련 처리
 */
 /* 파일을 선택했을 때 파일명이 보이게 처리 */
 $('#attach-file').on('change', function(){
 	$('#file-name').text( this.files[0].name );
 	$('#delete-file').css('display', 'inline');
 });
 $('#delete-file').on('click', function(){
 	$('#file-name').text('');
	$('#delete-file').css('display', 'none');
	$('#attach-file').val('');
 });