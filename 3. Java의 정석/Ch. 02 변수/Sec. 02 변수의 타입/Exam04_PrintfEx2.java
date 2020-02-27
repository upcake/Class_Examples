package sec02;

class Exam04_PrintfEx2 {
	public static void main(String[] args) {
		byte b = 1;
		short s = 2;
		char c = 'A';

		int finger = 10;
		long big = 100_000_000_000L; // long big = 100000000000L;
		long hex = 0xFFFF_FFFF_FFFF_FFFFL;

		int octNum = 010; 	// 8진수 10, 10진수로는 8
		int hexNum = 0x10; 	// 16진수 10, 10진수로는 16
		int binNum = 0b10; 	// 2진수 10, 10진수로는 2

		System.out.printf("b=%d%n", b); // %d는 정수 형식으로 출력, %n는 줄바꿈
		System.out.printf("s=%d%n", s);
		System.out.printf("c=%c, %d %n", c, (int) c); 	// %c는 문자로 출력
		// char타입의 값을 %d로 출력하려면 int타입으로 형변환이 필요함
		System.out.printf("finger=[%5d] %n", finger); 	// []는 출력될 값이 차지할 공간을 숫자로 지정할 수 있음
		System.out.printf("finger=[%-5d] %n", finger);	// -는 왼쪽 정렬
		System.out.printf("finger=[%05d] %n", finger);	// 빈 공간을 0으로 채움
		System.out.printf("big=%d%n", big);
		System.out.printf("hex=%#x%n", hex); // #은 접두사 (16진수 0x, 8진수 0)
		System.out.printf("octNum=%o, %d%n", octNum, octNum);
		System.out.printf("hexNum=%x, %d%n", hexNum, hexNum);
		System.out.printf("binNum=%s, %d%n", Integer.toBinaryString(binNum), binNum);
		// 10진수를 2진수로 출력해주는 지시자는 없기 때문에, 정수를 2진 문자열로 변환해주는 메서드를 사용해야 함
	}
}