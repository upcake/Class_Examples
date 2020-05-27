package com.hanul.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDAO {
/*
	- getConn()		: DB 접속 ▶ ojdbc6.jar 등록
	- insert()		: 도서 정보 등록
	- getAllList() 	: 전체 도서 목록 조회
	- delete()		: 도서 정보 삭제
	- dbClose()		: DB 접속 해제
 */
	//객체 선언
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	//DB 접속 메서드
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hanul";
		String password = "0000";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn() Exception");
		}
		return conn;
	} //getConn()
	
	//도서 정보 등록 메서드 ①
	public int insert(BookDTO dto) {
		conn = getConn();
		String sql ="INSERT INTO book VALUES(?, ?, ?, ?, ?, ?, ?)";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getAuth());
			ps.setString(3, dto.getIsbn());
			ps.setString(4, dto.getComp());
			ps.setInt(5, dto.getCost());
			ps.setInt(6, dto.getSu());
			ps.setInt(7, dto.getPrice());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert() Exception");
		} finally {
			dbClose();
		}
		return succ;
	} //insert()
	
	//도서 정보 등록 메서드 ②
	public int insert2(BookDTO dto) {
		conn = getConn();
		String sql ="INSERT INTO book VALUES(?, ?, ?, ?, ?, ?, ?)";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getAuth());
			ps.setString(3, dto.getIsbn());
			ps.setString(4, dto.getComp());
			ps.setInt(5, dto.getCost());
			ps.setInt(6, dto.getSu());
			ps.setInt(7, dto.getCost() * dto.getSu());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert() Exception");
		} finally {
			dbClose();
		}
		return succ;
	} //insert2()
	
	//도서 목록 조회 메서드
	public ArrayList<BookDTO> getAllList() {
		conn = getConn();
		String sql = "SELECT * FROM book";
		ArrayList<BookDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String title = rs.getString("title");
				String auth = rs.getString("auth");
				String isbn = rs.getString("isbn");
				String comp = rs.getString("comp");
				int cost = rs.getInt("cost");
				int su = rs.getInt("su");
				int price = rs.getInt("price");
				BookDTO dto = new BookDTO(title, auth, isbn, comp, cost, su, price);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getAllList() Exception");
		} finally {
			dbClose();
		}
		return list;
	} //getAllList()
	
	//도서 정보 삭제 메서드
	public int delete(String isbn) {
		conn = getConn();
		String sql = "DELETE FROM book WHERE isbn = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, isbn);
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete() Exception");
		} finally {
			dbClose();
		}
		return succ;
	} //delete()
	
	//도서 isbn 검색 메서드
	public BookDTO getByIsbn(String isbn) {
		conn = getConn();
		String sql = "SELECT * FROM book WHERE isbn = ?";
		BookDTO dto = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, isbn);
			rs = ps.executeQuery();
			if (rs.next()) {
				String title = rs.getString("title");
				String auth = rs.getString("auth");
				isbn = rs.getString("isbn");
				String comp = rs.getString("comp");
				int cost = rs.getInt("cost");
				int su = rs.getInt("su");
				int price = rs.getInt("price");
				dto = new BookDTO(title, auth, isbn, comp, cost, su, price);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getByIsbn() Exception!!!");
		} finally {
			dbClose();
		}
		return dto;
	} //getByIsbn()
	
	//도서 정보 수정 메서드
	public int update(BookDTO dto) {
		conn = getConn();
		String sql = "UPDATE book SET title = ?, auth = ?, comp = ?, cost = ?, su = ?, price = ? WHERE isbn = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getAuth());
			ps.setString(3, dto.getComp());
			ps.setInt(4, dto.getCost());
			ps.setInt(5, dto.getSu());
			ps.setInt(6, dto.getCost() * dto.getSu());
			ps.setString(7, dto.getIsbn());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("update() Exception!!!");
		} finally {
			dbClose();
		}
		return succ;
	} //update()
	
	//DB 접속 해제 메서드
	public void dbClose() {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception");
		}
	} //dbClose()
} //class