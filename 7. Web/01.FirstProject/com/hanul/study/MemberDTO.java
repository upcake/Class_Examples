package com.hanul.study;

public class MemberDTO {
	private String irum;
	private String id;
	private String pw;
	private int age;
	private String addr;
	
	public MemberDTO() {}

	public MemberDTO(String irum, String id, String pw, int age, String addr) {
		super();
		this.irum = irum;
		this.id = id;
		this.pw = pw;
		this.age = age;
		this.addr = addr;
	}

	public String getIrum() {
		return irum;
	}

	public void setIrum(String irum) {
		this.irum = irum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
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
}