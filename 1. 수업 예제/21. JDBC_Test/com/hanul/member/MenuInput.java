package com.hanul.member;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;

public class MenuInput {	// 회원 관리 서브 화면
	private Scanner scanner;
	public MenuInput (Scanner scanner) {
		this.scanner = scanner;
	}
	
	// 회원 정보 입력 및 등록 서브 화면
	public void insertInput() {
		System.out.println("신규 회원 정보 등록화면입니다.");
		System.out.print("번호를 입력하세요> ");
		int num = Integer.parseInt(scanner.nextLine());
		
		// MemberDAO 객체에서 DB에 접속한 후 삽입할 번호의 중복 검사를 수행
		MemberDAO dao = new MemberDAO();
		ResultSet rs = dao.checkNum(num);
		try {
			if(rs.next() == true) { // 검색 결과가 있다 ▶ 중복된 번호가 있다.
				System.out.println("입력하신 " + num + "번 자료는 이미 존재합니다!");
			} else { // 중복된 번호가 없다 ▶ 신규 회원 등록이 가능 
				System.out.print("이름을 입력하세요> ");
				String name = scanner.nextLine();
				System.out.print("나이를 입력하세요> ");
				int age = Integer.parseInt(scanner.nextLine());
				System.out.print("주소를 입력하세요> ");
				String addr = scanner.nextLine();
				System.out.print("전화번호를 입력하세요> ");
				String tel = scanner.nextLine();
				
//				System.out.println("num : " + num);
//				System.out.println("name : " + name);
//				System.out.println("age : " + age);
//				System.out.println("addr : " + addr);
//				System.out.println("tel : " + tel);
				MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
				int succ = dao.memberInsert(dto);
				if(succ > 0) {
					System.out.println(num + "번 회원님의 정보가 등록되었습니다.");
				} else {
					System.out.println(num + "번 회원님의 정보가 등록되지 않았습니다.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertInput() Exception!!!");
		}
	} // insertInput()
	
	// 회원 정보 수정하는 서브 화면
	public void updateInput() {
		System.out.println("회원 정보 수정 화면입니다.");
		System.out.print("수정할 회원 번호를 입력하세요> ");
		int num = Integer.parseInt(scanner.nextLine());
		// MemberDAO 객체에서 DB에 접속한 후 삭제할 번호의 유무를 검사
		MemberDAO dao = new MemberDAO();
		ResultSet rs = dao.checkNum(num);
		try {
			if(rs.next() != true) { // rs.next() == false
				System.out.println("입력하신 " + num + "번 자료는 없습니다!");
			} else {
				System.out.print(num + "번 회원님의 수정할 이름을 입력하세요> ");
				String name = scanner.nextLine();
				System.out.print(num + "번 회원님의 수정할 나이를 입력하세요> ");
				int age = Integer.parseInt(scanner.nextLine());
				System.out.print(num + "번 회원님의 수정할 주소를 입력하세요> ");
				String addr = scanner.nextLine();
				System.out.print(num + "번 회원님의 수정할 전화번호를 입력하세요> ");
				String tel = scanner.nextLine();
				
				MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
				int succ = dao.memberUpdate(dto);
				if(succ > 0) {
					System.out.println(num + "번 회원님의 정보가 수정되었습니다.");
				} else {
					System.out.println(num + "번 회원님의 정보의 수정에 실패했습니다.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateInput() Exception!!!");
		}
	} // updateInput()
	
	// 회원 정보 삭제하는 서브 화면
	public void deleteInput() {
		System.out.println("회원 정보 삭제 화면입니다.");
		System.out.print("삭제할 회원 번호를 입력하세요> ");
		int num = Integer.parseInt(scanner.nextLine());
		
		// MemberDAO 객체에서 DB에 접속한 후 삭제할 번호의 유무를 검사
		MemberDAO dao = new MemberDAO();
		ResultSet rs = dao.checkNum(num);
		try {
			if(rs.next() != true) { // rs.next() == false
				System.out.println("입력하신 " + num + "번 자료는 없습니다!");
			} else {
				System.out.print("정말 삭제하시겠습니까? (Y/N)> ");
				String isDelete = scanner.nextLine();
				if(isDelete.equalsIgnoreCase("y")) {
					int succ = dao.memberDelete(num);
					if(succ > 0) {
						System.out.println(num + "번 회원 정보가 삭제되었습니다.");
					} else {
						System.out.println(num + "번 회원 정보의 삭제에 실패했습니다.");
					}
				} else if(isDelete.equalsIgnoreCase("n")) {
					System.out.println("취소되었습니다.");
				} else {
					System.out.println("잘못 입력하셨습니다.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteInput() Exception!!!");
		}
	} // deleteInput()
	
	// 회원 정보 출력하는 서브 화면
	public void searchAllInput() {
		System.out.println("회원 정보 출력 화면입니다.");
		MemberDAO dao = new MemberDAO();
		dao.memberSearchAll();
	} // searchAllInput()
	
	// 회원 이름 검색하는 서브 화면
	public void searchNameInput() {
		System.out.println("회원 이름 검색 화면입니다.");
		System.out.print("검색할 회원 이름을 입력하세요> ");
		String searchName = scanner.nextLine();
		
		ArrayList<MemberDTO> list = new ArrayList<>();
		MemberDAO dao = new MemberDAO();
		dao.memberSearchName(list, searchName);
	} // searchNameInput()
	
	// 회원 주소 검색하는 서브 화면
	public void searchAddrInput() {
		System.out.println("회원 주소 검색 화면입니다.");
		System.out.print("검색할 회원 주소를 입력하세요> ");
		String searchAddr = scanner.nextLine();
		
		ArrayList<MemberDTO> list = new ArrayList<>();
		MemberDAO dao = new MemberDAO();
		dao.memberSearchAddr(list, searchAddr);
	} // searchAddrInput()
	
	// 회원 전화번호 검색하는 서브 화면
	public void searchTelInput() {
		System.out.println("회원 전화번호 검색 화면입니다.");
		System.out.print("검색할 회원 주소를 입력하세요> ");
		String searchTel = scanner.nextLine();
		
		ArrayList<MemberDTO> list = new ArrayList<>();
		MemberDAO dao = new MemberDAO();
		dao.memberSearchTel(list, searchTel);
	} // searchTelInput()
} // class