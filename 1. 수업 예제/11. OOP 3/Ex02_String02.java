public class Ex02_String02 {
	// 문자열의 대소 관계 비교(compareTo()), compareToIgnoreCase(), 동등관계 비교(equals(), equalsIgnoreCase())
	public static void main(String[] args) {
		String str1 = "APPLE";
		String str2 = "ORANGE";
		String str3 = "APPLE";
		String str4 = "apple";
		
//		if(str1 > str2) {}	▶ 오류 : 문자열의 대소 관계는 비교 연산자를 사용할 수 없다.
		// 문자열의 비교는 유니코드 값으로 비교한다 ▶ compareTo()
		// compareTo() 결과 : 양수, 0, 음수
		int result = str1.compareTo(str2);
		System.out.println(result);	// -14(음수) : str2가 더 크다
		// A의 아스키코드 = 65 O의 아스키 코드 = 79 첫글자가 같을때 다음 글자를 비교한다

		result = str1.compareTo(str3);
		System.out.println(result);	// 0 : str1과 str2는 같다
		
		result = str1.compareTo(str4);
		System.out.println(result); // -32(음수) : str4가 더 크다
		
		result = str1.compareToIgnoreCase(str4);	// 대소문자 구분없이 비교
		System.out.println(result);	// 0 : str1과 str4는 같다
		
		// 문자열이 같은지 다른지(동등관계)를 판단 ▶ if(str1.compareTo(str2) == 0)
		if(str1.equals(str4)) {		// equals() : true, false 반환
			System.out.println(str1 + "과(와) " + str4 + "은(는) 같다.");
		} else {
			System.out.println(str1 + "과(와) " + str4 + "은(는) 같지 않다.");
		}

		if(str1.equals(str4.toUpperCase())) {
			System.out.println(str1 + "과(와) " + str4 + "은(는) 같다.");
		} else {
			System.out.println(str1 + "과(와) " + str4 + "은(는) 같지 않다.");
		}
		
		if(str1.toLowerCase().equals(str4)) {
			System.out.println(str1 + "과(와) " + str4 + "은(는) 같다.");
		} else {
			System.out.println(str1 + "과(와) " + str4 + "은(는) 같지 않다.");
		}
		
		if(str1.equalsIgnoreCase(str4)) {	// 대소문자 구분없이 비교한다
			System.out.println(str1 + "과(와) " + str4 + "은(는) 같다.");
		} else {
			System.out.println(str1 + "과(와) " + str4 + "은(는) 같지 않다.");
		}
	} // main()
} // class	