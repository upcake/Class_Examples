package board;

import java.util.List;

public interface BoardService {
	//CRUD
	int board_insert(BoardVO vo);
	BoardPage board_list(BoardPage page);
	BoardVO board_detail(int id);
	void board_read(int id);
	int board_update(BoardVO vo);
	int board_delete(int id);
	
	int board_comment_insert(BoardCommentVO vo);
	List<BoardCommentVO> board_comment_list(int pid);
	int board_comment_update(BoardCommentVO vo);
	int board_comment_delete(int id);
}