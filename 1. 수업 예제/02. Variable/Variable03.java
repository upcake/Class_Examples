public class Variable03 {
	public static void main(String[] args) {
		//정수형 데이터 타입 : byte(1), short(2), int(4), long(8)
		byte b = 100;	// 1Byte : -128 ~ 127
		System.out.println("변수 b : " + b);
		
		short s = 10000; // 2Byte : -32,768 ~ 32,767
		System.out.println("변수 s : " + s);
		
		int i = 100000; // 4Byte : -2,147,486,648 ~ 2,147,486,647
		System.out.println("변수 i : " + i);
		
		long l = 1234567890123456789L; // 8Byte : 리터럴(값) 뒤에 접미사 L을 사용
		System.out.println("변수 l : " + l);
	} //main()
} //class
