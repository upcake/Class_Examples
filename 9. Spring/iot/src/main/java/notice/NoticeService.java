package notice;

import java.util.List;

public interface NoticeService {
	//CRUD : Create, Read, Update, Delete
	void notice_insert(NoticeVO vo);	//공지글 저장
	List<NoticeVO> notice_list();	//공지글 목록 조회
	NoticePage notice_list(NoticePage page);	//페이지 처리 된 공지글 목록 조회
	NoticeVO notice_detail(int id); //공지글 상세 조회
	void notice_update(NoticeVO vo); //공지글 변경 저장
	void notice_delete(int id); //공지글 삭제
	void notice_read(int id); //조회수 증가 처리
	void notice_reply_insert(NoticeVO vo); //답글 저장
}