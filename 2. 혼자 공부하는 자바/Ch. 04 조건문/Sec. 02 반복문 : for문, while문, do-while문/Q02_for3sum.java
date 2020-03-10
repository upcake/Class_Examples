package sec02;

public class Q02_for3sum {
	public static void main(String[] args) {
		// for문을 이용해서 1부터 100까지의 정수 중에 3의 배수의 총합을 구하는 코드를 작성하라.
		int sum = 0;
		for(int i = 1; i <= 100; i++) {
			if(i % 3 == 0) {
				sum += i;
			} // if
		} // for
		System.out.println(sum);
	} // main()
} // class