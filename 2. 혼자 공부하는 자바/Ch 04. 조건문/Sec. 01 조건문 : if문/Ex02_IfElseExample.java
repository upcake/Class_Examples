package sec01;

public class Ex02_IfElseExample {
	public static void main(String[] args) {
		int score = 85;
		
		if(score >= 90) {
			System.out.println("점수가 90보다 큽니다.");
			System.out.println("등급은 A입니다.");
		} else {	// score가 90 미만일 경우
			System.out.println("점수가 90보다 작습니다.");
			System.out.println("등급은 B입니다.");
		} // if
	} // main
} // class