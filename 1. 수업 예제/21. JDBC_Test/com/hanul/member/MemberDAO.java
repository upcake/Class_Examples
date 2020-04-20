package com.hanul.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
	private Connection conn;		//연결
	private PreparedStatement ps;	//전송
	private ResultSet rs;			//결과
	
	// MemberDAO 객체 생성될 때 DB 접속
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB접속 Exception!!!");
		}
	}
	
	// 번호 검색 메서드
	public ResultSet checkNum(int num) {
		try {
			String sql = "select * from tblMember where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("checkNum");
		}
		return rs;
	} // checkNum()
	
	// 회원 정보 저장 메서드
	public int memberInsert(MemberDTO dto) {
		int succ = 0;
		try {
			String sql = "insert into tblMember values(?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getNum());
			ps.setString(2, dto.getName());
			ps.setInt(3, dto.getAge());
			ps.setString(4, dto.getAddr());
			ps.setString(5, dto.getTel());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return succ;
	} // memberInsert
	
	// 회원 정보 삭제
	public int memberDelete(int num) {
		int succ = 0;
		try {
			String sql = "delete from tblMember where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return succ;
	} // memberDelete
	
	// 회원 정보 수정
	public int memberUpdate(MemberDTO dto) {
		int succ = 0;
		try {
			String sql = "update tblMember set name = ?, age = ?, addr = ?, tel = ? where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setInt(2, dto.getAge());
			ps.setString(3, dto.getAddr());
			ps.setString(4, dto.getTel());
			ps.setInt(5, dto.getNum());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return succ;
	} // memberUpdate()
	
	// 회원 정보 출력
	public void memberSearchAll() {
		try {
			String sql = "select * from tblMember order by num asc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				System.out.println(num + "\t" + name + "\t" + age + "\t" + addr + "\t" + tel);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("searchAllInput() Exception!!!");
		}
	}
	
	// 회원 이름 검색
	public void memberSearchName(ArrayList<MemberDTO> list, String searchName) {
		try {
			String sql = "select * from tblMember where name like ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + searchName + "%");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				
				MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
				list.add(dto);
			}
			
			// list의 내용을 출력
			if (list.size() == 0) {
				System.out.println("검색된 결과가 없습니다.");
			} else {
				for (MemberDTO dto : list) {
					System.out.print(dto.getNum() + "\t");
					System.out.print(dto.getName() + "\t");
					System.out.print(dto.getAge() + "\t");
					System.out.print(dto.getAddr() + "\t");
					System.out.print(dto.getTel() + "\n");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("searchName() Exception!!!");
		}
	} // memberSearchName()

	// 회원 주소 검색
	public void memberSearchAddr(ArrayList<MemberDTO> list, String searchAddr) {
		try {
			String sql = "select * from tblMember where addr like ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + searchAddr + "%");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				
				MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
				list.add(dto);
			}
			
			if (list.size() == 0) {
				System.out.println("검색된 결과가 없습니다.");
			} else {
				for (MemberDTO dto : list) {
					System.out.print(dto.getNum() + "\t");
					System.out.print(dto.getName() + "\t");
					System.out.print(dto.getAge() + "\t");
					System.out.print(dto.getAddr() + "\t");
					System.out.print(dto.getTel() + "\n");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // memberSearchAddr()
	
	// 회원 전화번호 검색
	public void memberSearchTel(ArrayList<MemberDTO> list, String searchTel) {
		try {
			String sql = "select * from tblMember where tel like ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + searchTel + "%");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				
				MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
				list.add(dto);
			}
			
			if (list.size() == 0) {
				System.out.println("검색된 결과가 없습니다.");
			} else {
				for (MemberDTO dto : list) {
					System.out.print(dto.getNum() + "\t");
					System.out.print(dto.getName() + "\t");
					System.out.print(dto.getAge() + "\t");
					System.out.print(dto.getAddr() + "\t");
					System.out.print(dto.getTel() + "\n");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // memberSearchTel
	
	// DB Close
	public void dbClose() {
		try {
			if(rs != null) {
				rs.close();
			}
			
			if(ps != null) {
				ps.close();
			}
			
			if(conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // dbClose()
} // class