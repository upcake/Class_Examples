package sec02;

import java.util.Scanner;

public class q06 {
	public static void main(String[] args) {
		// 실행 결과를 보고 알맞게 작성하시오.
		boolean run = true;
		int studentNum = 0;
		int[] scores = null;
		Scanner scanner = new Scanner(System.in);
		
		while(run) {
			System.out.println("-----------------------------------------");
			System.out.println("1. 학생수 | 2. 점수 입력 | 3. 점수 리스트 | 4. 분석 | 5. 종료");
			System.out.println("-----------------------------------------");
			System.out.print("선택> ");
			
			int selectNo = Integer.parseInt(scanner.nextLine());
			
			if(selectNo == 1) {
				// 작성 위치
				System.out.print("학생수> ");
				studentNum = Integer.parseInt(scanner.nextLine());
				scores = new int[studentNum];
			} else if(selectNo == 2) {
				// 작성 위치
				for (int i = 0; i < scores.length; i++) {
					System.out.print("scores[" + i + "]> " );
					scores[i] = Integer.parseInt(scanner.nextLine());
				} // for
			} else if(selectNo == 3) {
				// 작성 위치
				for (int i = 0; i < scores.length; i++) {
					System.out.println("scores[" + i + "]> " + scores[i]);
				} // for
			} else if(selectNo == 4) {
				// 작성 위치
				int sum = 0;
				double avg = 0;
				int max = 0;
//				int cnt = 0;
				for (int i = 0; i < scores.length; i++) {
					sum += scores[i];
//					cnt++;
					if(max < scores[i]) {
						max = scores[i];
					} // if
				} // for
//				avg = (double)sum / cnt;
				avg = (double)sum / studentNum;
				System.out.println("최고 점수 : " + max);
				System.out.println("평균 점수 : " + avg);
			} else if(selectNo == 5) {
				run = false;
			} // if else if
		} // while
		
		System.out.println("프로그램 종료");
	} // main()
} // class