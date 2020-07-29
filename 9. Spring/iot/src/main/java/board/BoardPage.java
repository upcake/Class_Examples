package board;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class BoardPage extends common.PageVO {
	private List<BoardVO> list;
	
	public List<BoardVO> getList() {
		return list;
	}
	
	public void setList(List<BoardVO> list) {
		this.list = list;
	}
}