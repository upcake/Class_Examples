package sec03;

public class Exam06_StringConcatExample {
	public static void main(String[] args) {
		// 숫자 연산
		int value = 10 + 2 + 8;
		System.out.println("value : " + value);
		
		// 문자열 결합 연산
		String str1 = 10 + 2 + "8"; 	// 숫자 + 숫자 + "문자열" = 숫자 + "문자열" = "숫자문자열"
		System.out.println("str1 : " + str1);
		
		String str2 = 10 + "2" + 8; 	// 숫자 + "문자열" + 숫자 = "숫자문자열숫자"
		System.out.println("str2 : " + str2);
		
		String str3 = "10" + 2 + 8; 	// "문자열" + 숫자 + 숫자 = "문자열숫자숫자"
		System.out.println("str3 : " + str3);
		
		String str4 = "10" + (2 + 8); 	// "문자열" + (숫자 + 숫자) = "문자열" + 숫자 = "문자열숫자"
		System.out.println("str4 : " + str4);
	}
}