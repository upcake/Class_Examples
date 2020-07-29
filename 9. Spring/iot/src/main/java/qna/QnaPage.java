package qna;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;

@Component
public class QnaPage extends PageVO {
	private List<QnaVO> list;

	public List<QnaVO> getList() {
		return list;
	}

	public void setList(List<QnaVO> list) {
		this.list = list;
	}
}