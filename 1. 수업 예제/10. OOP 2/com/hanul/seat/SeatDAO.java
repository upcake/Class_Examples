package com.hanul.seat;

import java.util.Arrays;
import java.util.Collections;

public class SeatDAO {

	private SeatDTO[] seat;	// 멤버 변수 선언
	public SeatDAO(SeatDTO[] seat) {
		this.seat = seat;
	}
	
	// 학생 분배 메소드
	public void divStudent() {
		// seat를 섞고 4개씩 중복검사를 한다.
		int i = 0;
		while(true) {
			if(i >= seat.length) {
				break;
			}
			if ( (i % 4 == 0) &&	// 중복 검사
				(seat[i].getGroupNo() != seat[i + 1].getGroupNo()) &&
				(seat[i].getGroupNo() != seat[i + 2].getGroupNo()) &&
				(seat[i].getGroupNo() != seat[i + 3].getGroupNo()) &&
				(seat[i + 1].getGroupNo() != seat[i + 2].getGroupNo()) &&
				(seat[i + 1].getGroupNo() != seat[i + 3].getGroupNo()) &&
				(seat[i + 2].getGroupNo() != seat[i + 3].getGroupNo()) ) {
			} else {
				Collections.shuffle(Arrays.asList(seat));
				i = 0;
			} // if else
			if ( // 성별 검사, MMMM, FFFF 테이블 방지용
				(seat[i].getGender() == seat[i + 1].getGender()) &&
				(seat[i].getGender() == seat[i + 2].getGender()) &&
				(seat[i].getGender() == seat[i + 3].getGender()) &&
				(seat[i + 1].getGender() == seat[i + 2].getGender()) &&
				(seat[i + 1].getGender() == seat[i + 3].getGender()) &&
				(seat[i + 2].getGender() == seat[i + 3].getGender()) ) {
				Collections.shuffle(Arrays.asList(seat));
				i = 0;
				continue;
			} // if
			i += 4;
		} // while
	} // divStudent()

	// 출력 메소드
	public void display() {
		// 중복되는것이 없고 성별이 골고루 분포 되었으면 4개씩 끊어서 이름을 출력한다.
		int cnt = 1;
		for (int i = 0; i < seat.length; i++) {
			System.out.print(seat[i].getName() + seat[i].getGender() + "\t");
				if((i + 1) % 4 == 0) {
					System.out.print("교사" + cnt);
					cnt++;
					System.out.println();
				} // if
		} // for
	} // display()
} // class