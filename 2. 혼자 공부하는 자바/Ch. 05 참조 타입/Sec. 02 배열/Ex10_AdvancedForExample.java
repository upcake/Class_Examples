package sec02;

public class Ex10_AdvancedForExample {
	public static void main(String[] args) {
		// 향상된 for문
		int[] scores = {95, 71, 84, 93, 87};
		
		int sum = 0;
		for (int score : scores) {
			sum += score;
		} // for
		System.out.println("점수 총합 = " + sum);
		
		double avg = (double) sum / scores.length;
		System.out.println("점수 평균 = " + avg);
	} // main()
} // class