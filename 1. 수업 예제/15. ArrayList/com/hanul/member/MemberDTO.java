package com.hanul.member;

public class MemberDTO {
	// 멤버 변수 선언
	private String name;	// 이름
	private int age;		// 나이
	private String addr;	// 주소
	private String tel;		// 전화번호
	
	// 디폴트 생성자 메서드
	public MemberDTO() {}
	
	// 생성자 메서드 초기화
	public MemberDTO(String name, int age, String addr, String tel) {
		super();
		this.name = name;
		this.age = age;
		this.addr = addr;
		this.tel = tel;
	}
	
	// Getters & Setters 메서드
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}
