package board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements BoardService {
	@Autowired private SqlSession sql;
	
	@Override
	public int board_insert(BoardVO vo) {
		return sql.insert("board.mapper.insert", vo);
	}

	@Override
	public BoardPage board_list(BoardPage page) {
		page.setTotalList((Integer) sql.selectOne("board.mapper.total", page));
		page.setList(sql.selectList("board.mapper.list", page));
		return page;
	}

	@Override
	public BoardVO board_detail(int id) {
		return sql.selectOne("board.mapper.detail", id);
	}

	@Override
	public void board_read(int id) {
		sql.update("board.mapper.read", id);
	}

	@Override
	public int board_update(BoardVO vo) {
		return sql.update("board.mapper.update", vo);
	}

	@Override
	public int board_delete(int id) {
		return sql.delete("board.mapper.delete", id);
	}

	@Override
	public int board_comment_insert(BoardCommentVO vo) {
		return sql.insert("board.mapper.comment_insert", vo);
	}

	@Override
	public List<BoardCommentVO> board_comment_list(int pid) {
		return sql.selectList("board.mapper.comment_list", pid);
	}

	@Override
	public int board_comment_update(BoardCommentVO vo) {
		return sql.update("board.mapper.comment_update", vo);
	}

	@Override
	public int board_comment_delete(int id) {
		return sql.delete("board.mapper.comment_delete", id);
	}
}