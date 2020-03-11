import java.util.Scanner;

public class Test16_scanner3_sungjuk {
	public static void main(String[] args) {
		// 국어 점수를 입력하세요 : XX (0 ~ 100)
		// 영어 점수를 입력하세요 : XX (0 ~ 100)
		// 수학 점수를 입력하세요 : XX (0 ~ 100)
		//
		// 국어 점수 : XX
		// 영어 점수 : XX
		// 수학 점수 : XX
		// 총점 : XX
		// 평균 : XX
		// 학점 : X학점
		// =========================
		// 국어 점수를 입력하세요 : 789
		// 국어 점수를 잘못 입력하셨습니다!
		// 국어 점수를 입력하세요 : XX
		//
		// 영어 점수를 입력하세요 : 1000
		// 영어 점수를 잘못 입력하셨습니다!
		// 영어 점수를 입력하세요 : XX
		// 국어 점수 : kor
		// 영어 점수 : eng
		// 수학 점수 : mat
		// 총점 : sum
		// 평균 : avg
		// 학점 : grade
		
		Scanner scanner = new Scanner(System.in);
		
//		int kor = 0;			// 같은 타입 변수는 하나로 묶자
//		int eng = 0;
//		int mat = 0;
		int kor = 0, eng = 0, mat = 0;
		
		while(true) {
			System.out.print("국어 점수를 입력하세요 : ");
			kor = Integer.parseInt(scanner.nextLine());
			if(kor > 100 || kor < 0) {
				System.out.println("국어 점수를 잘못 입력하셨습니다!" + "\n");
				continue;
//			} else {			// 굳이 else 블록을 만들지 않아도 똑같음
//				break;
			} // if
			break;
		} // while
		System.out.println();
		
		while(true) {
			System.out.print("영어 점수를 입력하세요 : ");
			eng = Integer.parseInt(scanner.nextLine());
			if(eng > 100 || eng < 0) {
				System.out.println("영어 점수를 잘못 입력하셨습니다!" + "\n");
				continue;
//			} else {
//				break;
			} // if
			break;
		} // while
		System.out.println();
		
		while(true) {
			System.out.print("수학 점수를 입력하세요 : ");
			mat = Integer.parseInt(scanner.nextLine());
			if(mat > 100 || mat < 0) {
			System.out.println("수학 점수를 잘못 입력하셨습니다!" + "\n");
			continue;
//			} else {
//				break;
			} // if
			break;
		} // while
		scanner.close();
		System.out.println();

		int sum = kor + eng + mat;
		double avg = sum / 3.0;
		char grade = '0';
		System.out.println("국어 점수 : " + kor);
		System.out.println("영어 점수 : " + eng);
		System.out.println("수학 점수 : " + mat);
		System.out.println("총점 : " + sum);
		System.out.println("평균 : " + avg);
//		if(avg <= 100 && avg > 90) {		// 입력받은 수가 0 ~ 100까지이므로 당연히 평균도 100이하임
		if(avg > 90) {
			grade = 'A';
		} else if(avg > 80) {
			grade = 'B';
		} else if(avg > 70) {
			grade = 'C';
		} else if(avg > 60) {
			grade = 'D';
		} else {
			grade = 'F';
		} // if else
		System.out.println("학점 : " + grade + "학점");
	} // main()
} // class