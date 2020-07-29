package qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
	
@Service
public class QnaServiceImpl implements QnaService {
	@Autowired private QnaDAO dao;
	
	@Override
	public void qna_insert(QnaVO vo) {
		dao.qna_insert(vo);
	}

	@Override
	public List<QnaVO> qna_list() {
		return dao.qna_list();
	}

	@Override
	public QnaVO qna_detail(int id) {
		return dao.qna_detail(id);
	}

	@Override
	public void qna_update(QnaVO vo) {
		dao.qna_update(vo);
	}

	@Override
	public void qna_delete(int id) {
		dao.qna_delete(id);
	}

	@Override
	public void qna_read(int id) {
		dao.qna_read(id);
	}

	@Override
	public void qna_reply_insert(QnaVO vo) {
		dao.qna_reply_insert(vo);
	}

	@Override
	public QnaPage qna_list(QnaPage page) {
		return dao.qna_list(page);
	}

}
