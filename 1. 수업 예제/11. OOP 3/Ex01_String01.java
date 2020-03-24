import java.util.Arrays;

public class Ex01_String01 {
	// String Class : 문자열을 조작하기 위한 기능을 담고 있는 클래스
	// SunMicroSystem(Oracle) 업체에서 미리서 제작하여 제공 ▶ API(Library)
	// API 문서(설명서) : www.oracle.collm > Java APIs
	// JRE System Library > rt.jar > java.lang > String.class
	public static void main(String[] args) {
		String str1 = "apple";	// apple 문자열을 str1 변수에 할당
		String str2 = new String("APPLE");	// APPLE str2 객체에 할당
		
		System.out.println(str1);
		System.out.println(str2);
		
		// 문자열의 길이 : length()
		System.out.println("str1의 길이 : " + str1.length());
		
		// 대문자로 변경 : toUpperCase()
		System.out.println("str1을 대문자로 변경 : " + str1.toUpperCase());
		
		// 소문자로 변경 : toLowerCase()
		System.out.println("str2을 소문자로 변경 : " + str2.toLowerCase());
		
		// 특정 문자만 추출 : subString()
		System.out.println(str1.substring(1));		// index 1부터 끝까지 추출 (a는 index 0)
		System.out.println(str2.substring(1, 3));	// index 1부터 3의 앞까지 추출
		
		// 문자열에서 특정 문자 한 글자만 출력 : charAt()
		System.out.println(str2.charAt(3));
		System.out.println(str2.substring(3, 4));
		
		// 특정 문자의 존재 여부 : indexOf() ▶ 존재 : index 값을 반환, 실패 : -1
		int index = str2.indexOf("B");
		System.out.println(index);
		
		// 문자열 분리 : split()
		String str3 = "가나@다라@마바";
		String[] sp = str3.split("@");
		for (int i = 0; i < sp.length; i++) {
			System.out.println(sp[i]);
		}
		System.out.println(Arrays.toString(sp));
		
		// 문자열 치환(찾아 바꾸기) : replaceAll()
		System.out.println(str2.replaceAll("PP", "@@"));	// PP → @@
		System.out.println(str2.replaceAll("P", "@@"));	// PP → @@@@
		
		// 좌우 공백 제거 : trim()
		String str4 = "   abc   def   ";
		System.out.println(str4);
		System.out.println("공백 제거 전 길이 : " + str4.length());
		System.out.println(str4.trim());
		System.out.println("공백 제거 후 길이 : " + str4.trim().length());
	} // main()
} // class