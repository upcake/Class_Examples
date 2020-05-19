package com.hanul.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
	private Connection conn;		//연결 객체
	private PreparedStatement ps;	//전송 객체
	private ResultSet rs;			//결과 객체
	
	//DB 접속
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
	
	//회원가입
	public int memberInsert(MemberDTO dto) {
		conn = getConn();
		String sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?)";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getIrum());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPw());
			ps.setInt(4, dto.getAge());
			ps.setString(5, dto.getAddr());
			ps.setString(6, dto.getTel());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberInsert() Exception!!!");
		} finally {
			dbClose();
		}
		return succ;
	} //memberInsert()
	
	// 전체 목록 검색
	public ArrayList<MemberDTO> memberSearchAll() {
		conn = getConn();
		String sql = "SELECT * FROM member";
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String irum = rs.getString("irum");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				MemberDTO dto = new MemberDTO(irum, id, pw, age, addr, tel);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberSearchAll() Exception!!!");
		} finally {
			dbClose();
		}
		return list;
	} // memberSearchAll()
	
	//회원 정보 삭제
	public int memberDelete(String id) {
		conn = getConn();
		String sql = "DELETE FROM member WHERE id = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberDelete() Exception!!!");
		} finally {
			dbClose();
		}
		return succ;
	}// memberDelete()
	
	//회원 ID 검색
	public MemberDTO getById(String id) {
		conn = getConn();
		String sql = "SELECT * FROM member WHERE id = ?";
		MemberDTO dto = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				String irum = rs.getString("irum");
				id = rs.getString("id");
				String pw = rs.getString("pw");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				dto = new MemberDTO(irum, id, pw, age, addr, tel);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getById() Exception!!!");
		} finally {
			dbClose();
		}
		return dto;
	} //getById()
	
	//DB 접속 해제
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
}// class