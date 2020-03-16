package sec02;

public class Ex07_ArrayReferenceObjectExample {
	public static void main(String[] args) {
		String[] strArray = new String[3];
		strArray[0] = "Java";
		strArray[1] = "Java";
		strArray[2] = new String("Java");
		
		System.out.println(strArray[0] == strArray[1]);			// 문자열끼리의 == 연산자는 객체의 번지를 비교
		System.out.println(strArray[0] == strArray[2]);
		System.out.println(strArray[0].equals(strArray[2]));	// 문자열 자체를 비교할때는 equals를 사용한다
	} // main()
} // class