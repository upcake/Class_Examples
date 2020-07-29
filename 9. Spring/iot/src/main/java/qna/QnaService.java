package qna;

import java.util.List;

public interface QnaService {
	//CRUD
	void qna_insert(QnaVO vo); 		//글 저장
	List<QnaVO> qna_list();			//목록 조회
	QnaPage qna_list(QnaPage page);	//페이지 처리 된 공지글 목록 조회
	QnaVO qna_detail(int id);		//상세 조회
	void qna_update(QnaVO vo);		//글 수정
	void qna_delete(int id);		//글 삭제
	void qna_read(int id);			//조회수 증가 처리
	void qna_reply_insert(QnaVO vo);//답글 저장
}
