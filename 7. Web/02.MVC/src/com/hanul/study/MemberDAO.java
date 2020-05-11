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
	
	//DB 접속 : 정적 로딩(ojdbc6.jar ▶ WebContent → WEB-INF → lib 붙여넣기)
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hanul";
		String password = "0000";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
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
	
	//전체 회원 검색
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
			System.out.println("memberSearchAll Exception!!!");
		} finally {
			dbClose();
		}
		return list;
	} //memberSearchAll()
	
	//DB Close
	public void dbClose() {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception!!!");
		}
	} //db Close

} //class