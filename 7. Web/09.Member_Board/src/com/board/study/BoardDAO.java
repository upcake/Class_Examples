package com.board.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hanul";
		String password = "0000";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn() Exception!!!");
		}
		return conn;
	} //getConn()

	//게시글 등록
	public int boardInsert(BoardDTO dto) {
		conn = getConn();
		String sql = "";
		int b_num = 0;
		int succ = 0;
		try {
			//글 번호를 검색한 후 등록할 글 번호(b_num)를 결정
			sql = "SELECT MAX(board_num) FROM memberBoard";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) { //글이 있으면 (글 갯수 + 1)번
				b_num = rs.getInt(1);
				b_num += 1;
			} else { // 글이 없으면 1번
				b_num = 1;
			}
			
			//글 등록
			sql = "INSERT INTO memberBoard VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_num);
			ps.setString(2, dto.getBoard_id());
			ps.setString(3, dto.getBoard_subject());
			ps.setString(4, dto.getBoard_content());
			ps.setString(5, dto.getBoard_file());
			ps.setInt(6, b_num); //댓글을 쓰기 위한 그룹 번호
			ps.setInt(7, 0); //댓글이 없으니 0
			ps.setInt(8, 0);
			ps.setInt(9, 0);
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("boardInsert() Exception!!!");
		} finally {
			dbClose();
		}
		return succ;
	} //boardInsert()
	
	//등록된 글의 총 개수
	public int getListCount() {
		conn = getConn();
		String sql = "SELECT COUNT(*) FROM memberBoard";
		//NULL이 들어갈 수 있는 필드도 있으므로 모든 필드를 센 다음에 가장 많이 나온 필드를 기준으로 한다.
		int listCount = 0;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);	//board_num 필드는 NULL값이 들어올 수 없으니 board_num을 가져온다.
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getListCount() Exception!!!");
		} finally {
			dbClose();
		}
		return listCount;
	} //getListCount()
	
	//전체 글 목록 조회(Feat : 페이징 
	public ArrayList<BoardDTO> getBoardList(int page, int limit) {
		conn = getConn();
		String sql = "SELECT * FROM";
		sql += " (SELECT ROWNUM rnum, board_num, board_id,";
		sql	+= " board_subject, board_content, board_file, board_re_ref,";
		sql += " board_re_lev, board_re_seq, board_readcount, board_date";
		sql	+= " FROM (SELECT * FROM memberBoard ORDER BY";
		sql += " board_num DESC, board_re_seq ASC))";
		sql += "WHERE rnum >= ? and rnum <= ?";
		int startRow = (page - 1) * 10 + 1; //읽기 시작할 rownum
		int endRow = startRow + limit - 1;	//읽을 마지막 rownum
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, endRow);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBoard_num(rs.getInt("board_num"));
				dto.setBoard_id(rs.getString("board_id"));
				dto.setBoard_subject(rs.getString("board_subject"));
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_file(rs.getString("board_file"));
				dto.setBoard_re_ref(rs.getInt("board_re_ref"));
				dto.setBoard_re_lev(rs.getInt("board_re_lev"));
				dto.setBoard_re_seq(rs.getInt("board_re_seq"));
				dto.setBoard_readcount(rs.getInt("board_readcount"));
				dto.setBoard_date(rs.getString("board_date"));
				list.add(dto);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getBoardList() Exception!!!");
		} finally {
			dbClose();
		}
		return list;
		
	}

	//글 내용 보기
	public BoardDTO getDetail(int board_num) {
		conn = getConn();
		String sql = "SELECT * FROM memberBoard WHERE board_num = ?";
		BoardDTO dto = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, board_num);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setBoard_num(rs.getInt("board_num"));
				dto.setBoard_id(rs.getString("board_id"));
				dto.setBoard_subject(rs.getString("board_subject"));
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_file(rs.getString("board_file"));
				dto.setBoard_re_ref(rs.getInt("board_re_ref"));
				dto.setBoard_re_lev(rs.getInt("board_re_lev"));
				dto.setBoard_re_seq(rs.getInt("board_re_seq"));
				dto.setBoard_readcount(rs.getInt("board_readcount"));
				dto.setBoard_date(rs.getString("board_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getDetail() Exception!!!");
		} finally {
			dbClose();
		}
		return dto;
	} //getDetail()
	
	//조회수 증가
	public void readCount(int board_num) {
		conn =getConn();
		String sql = "UPDATE memberBoard SET board_readcount = ";
		sql += "board_readcount + 1 WHERE board_num = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, board_num);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("readCount() Excetption!!!");
		} finally {
			dbClose();
		}
	} //readCount()
	
	//작성자 확인
	public boolean isBoardWriter(int board_num, String id) {
		conn = getConn();
		String sql = "SELECT * FROM memberBoard WHERE board_num = ?";
		boolean result = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, board_num);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				if(id.equals(rs.getString("board_id"))) {
					result = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("isBoardWriter() Exception!!!");
		} finally {
			dbClose();
		}
		return result;
	} //isBoardWriter()

	//글 삭제
	public int boardDelete(int board_num) {
		conn = getConn();
		String sql = "DELETE FROM memberBoard WHERE board_num = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, board_num);
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("boardDelete() Exception!!!");
		} finally {
			dbClose();
		}
		return succ;
	} //boardDelete()
	
	//글 수정
	public int boardUpdate(BoardDTO dto) {
		conn = getConn();
		String sql = "UPDATE memberBoard SET board_subject = ?, ";
		sql += "board_content = ? WHERE board_num = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getBoard_subject());
			ps.setString(2, dto.getBoard_content());
			ps.setInt(3, dto.getBoard_num());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("boardUpdate() Exception!!!");
		} finally {
			dbClose();
		}
		return succ;
	} //boardUpdate()

	//DB 종료
		public void dbClose() {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("dbClose() Exception!!!");
			}
		} //dbClose()



} //class