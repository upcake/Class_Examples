package com.hanul.student;

public class StudentDTO {
	private int num;
	private String name, major;
	private float cpp, java, sum, avg;
	
	public StudentDTO() {}

	public StudentDTO(int num, String name, String major, float cpp, float java) {
		super();
		this.num = num;
		this.name = name;
		this.major = major;
		this.cpp = cpp;
		this.java = java;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public float getCpp() {
		return cpp;
	}

	public void setCpp(float cpp) {
		this.cpp = cpp;
	}

	public float getJava() {
		return java;
	}

	public void setJava(float java) {
		this.java = java;
	}

	public float getSum() {
		return sum;
	}

	public void setSum(float sum) {
		this.sum = sum;
	}

	public float getAvg() {
		return avg;
	}

	public void setAvg(float avg) {
		this.avg = avg;
	}
	
	
	
} // class