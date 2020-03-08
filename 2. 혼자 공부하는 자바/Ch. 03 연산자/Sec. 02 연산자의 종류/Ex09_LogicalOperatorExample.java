package sec02;

public class Ex09_LogicalOperatorExample {
	public static void main(String[] args) {
		// 논리 연산자
		int charCode = 'A';
		
		if( (charCode >= 65) & (charCode <= 90) ) {
			System.out.println("대문자군요");
		} // if
		
		if( (charCode >= 97) && (charCode <= 122) ) {
			System.out.println("소문자군요");
		} // if
		
		if( (charCode >= 48) && (charCode <= 57) ) {
			System.out.println("0 ~ 9 숫자군요");
		} // if
		
		int value = 6;
		
		if( (value % 2 == 0) | (value % 3 == 0) ) {
			System.out.println("2 또는 3의 배수군요");
		} // if
		
		if( (value % 2 == 0) || (value % 3 == 0) ) {
			System.out.println("2 또는 3의 배수군요");
		} // if
	} // main()
} // class