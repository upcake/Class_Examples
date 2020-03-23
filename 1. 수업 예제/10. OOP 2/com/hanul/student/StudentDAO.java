package com.hanul.student;

import java.text.DecimalFormat;

public class StudentDAO {
	private StudentDTO[] stdnt;
	public StudentDAO(StudentDTO[] stdnt) {
		this.stdnt = stdnt;
	}
	
	// ÃÑÇÕ °è»ê
	public void getSum() {
		for (int i = 0; i < stdnt.length; i++) {
			stdnt[i].setSum(stdnt[i].getJava() + stdnt[i].getCpp());
		}
	} // getSum()

	public void getAvg() {
		for (int i = 0; i < stdnt.length; i++) {
			stdnt[i].setAvg(stdnt[i].getSum() / 2);
		}
	} // getAvg()

	public void sumDescSort() {
		for (int i = 0; i < stdnt.length; i++) {
			for (int j = i + 1; j < stdnt.length; j++) {
				if(stdnt[i].getSum() < stdnt[j].getSum()) {
					StudentDTO temp = stdnt[i];
					stdnt[i] = stdnt[j];
					stdnt[j] = temp;
				}
			}
		}
	} // sumDescSort()

	public void display() {
		DecimalFormat df = new DecimalFormat("0.0");
		System.out.println("¼º¸í\tÇÐ¹ø\tÇÐ°ú\tC++\tJAVA\tÃÑÁ¡\tÆò±Õ");
		System.out.println("====================================================");
		for (int i = 0; i < stdnt.length; i++) {
			System.out.print(stdnt[i].getName() + "\t");
			System.out.print(stdnt[i].getNum() + "\t");
			System.out.print(stdnt[i].getMajor() + "\t");
			System.out.print(stdnt[i].getCpp() + "\t");
			System.out.print(stdnt[i].getJava() + "\t");
			System.out.print(df.format(stdnt[i].getSum()) + "\t");
			System.out.print(df.format(stdnt[i].getAvg()) + "\n");
		}
		System.out.println("====================================================");
	} // display()

	public void nameAscSort() {
		for (int i = 0; i < stdnt.length; i++) {
			for (int j = i + 1; j < stdnt.length; j++) {
				if(stdnt[i].getName().compareTo(stdnt[j].getName()) > 0) {
					StudentDTO temp = stdnt[i];
					stdnt[i] = stdnt[j];
					stdnt[j] = temp;
				}
			}
		}
	} // nameAscSort()
} // class