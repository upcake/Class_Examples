package sec02;

public class Q05 {
	public static void main(String[] args) {
		// 중첩 for문을 이용해서 주어진 배열의 전체 항목의 합과 평균값을 구하시오.
		int[][] array = {
				{95, 86},
				{83, 92, 96},
				{78, 83, 93, 87, 88}
		}; // array
		
		int sum = 0;
		double avg = 0.0;
		
		// 작성 위치
		double cnt = 0;
		for (int i = 0; i < array.length; i++) {
			for (int j = 0; j < array[i].length; j++) {
				sum += array[i][j];
				cnt++;
			} // for j
		} // for i
		avg = sum / cnt;
		
		System.out.println("sum : " + sum);
		System.out.println("avg : " + avg);
	} // main()
} // class