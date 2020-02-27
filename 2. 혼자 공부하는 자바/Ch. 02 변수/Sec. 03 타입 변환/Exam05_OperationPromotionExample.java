package sec03;

public class Exam05_OperationPromotionExample {
	public static void main(String[] args) {
		byte byteValue1 = 10;
		byte byteValue2 = 20;
//		byte byteValue3 = byteValue1 + byteValue2;
		// byte 변수가 피연산자로 사용되면 int 타입으로 변환되어 연산되므로 컴파일 에러가 발생
		int intValue1 = byteValue1 + byteValue2;
		System.out.println(intValue1);
		
		char charValue1 = 'A';
		char charValue2 = 1;
//		char charValue3 = charValue1 + charValue2;
		// charValue1에서  A가 유니코드로 변환되어 65로 저장되고 int 타입으로 변환되어 연산되므로 컴파일 에러가 발생 
		int intValue2 = charValue1 + charValue2;
		System.out.println("유니코드 = " + intValue2);
		System.out.println("출력문자 = " + (char)intValue2);
		
		int intValue3 = 10;
		int intValue4 = intValue3/4;
		System.out.println(intValue4);
		
		int intValue5 = 10;
//		int intValue6 = 10 / 4.0;
		// 4.0은 double 타입이라 int 타입으로 자동 변환 될 수 없으므로 컴파일 에러 발생
		double doubleValue = intValue5 / 4.0;
		System.out.println(doubleValue);
		
		int x = 1;
		int y = 2;
		double result = (double) x / y;
		System.out.println(result);
	}
}