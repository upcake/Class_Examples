package sec02;

public class Ex04_ArrayLengthExample {
	public static void main(String[] args) {
		// ¹è¿­ÀÇ length ÇÊµå
		int[] scores = {83, 90, 87};
		
		int sum = 0;
		for (int i = 0; i < scores.length; i++) {
			sum += scores[i];
		} // for
		System.out.println("ÃÑÇÕ : " + sum);
		
		double avg = (double)sum / scores. length;
		System.out.println("Æò±Õ : " + avg);
	} // main()
} // class