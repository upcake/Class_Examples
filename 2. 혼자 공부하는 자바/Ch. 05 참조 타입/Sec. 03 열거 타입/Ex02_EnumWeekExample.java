package sec03;

import java.util.Calendar;

public class Ex02_EnumWeekExample {
	public static void main(String[] args) {
		Ex01_Week today = null;		// 열거 타입 변수 선언
		
		Calendar cal = Calendar.getInstance();
		// Calendar 변수 선언, Caledndar.getInstance() 메소드로 Calendar 객체 생성
		int week = cal.get(Calendar.DAY_OF_WEEK);	// 일(1) ~ 토(7)까지의 숫자를 리턴
		
		switch(week) {
			case 1:
				today = Ex01_Week.SUNDAY; break;	// 열거 상수 대입
			case 2:
				today = Ex01_Week.MONDAY; break;
			case 3:
				today = Ex01_Week.TUESDAY; break;
			case 4:
				today = Ex01_Week.WEDNESDAY; break;
			case 5:
				today = Ex01_Week.THURSDAY; break;
			case 6:
				today = Ex01_Week.FRIDAY; break;
			case 7:
				today = Ex01_Week.SATURDAY; break;
		 } // switch
		
		System.out.println("오늘 요일 : " + today);
		
		if(today == Ex01_Week.SUNDAY) {
			System.out.println("일요일에는 축구를 합니다.");
		} else {
			System.out.println("열심히 자바 공부합니다.");
		} // if else
	} // main()
} // class
