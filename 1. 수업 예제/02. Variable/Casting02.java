public class Casting02 {
	public static void main(String[] args) {
		char upper = 'A';
		char lower = 'a';
		
		System.out.println(upper);			// 출력값 : A(65)
		System.out.println(lower);			// 출력값 : a(97)
		System.out.println(upper + lower);	// 출력값 : 162
		
		// 대문자(upper)를 소문자로 바꾸어서 출력하시오.
		System.out.println((char)(upper + 32));
		
		// 아래의 명령은 몇 번의 형변환이 발생하는가?
		// double sum = 3.5F + 12;
		//① 3.5F + 12.0F ▶ int → float 등호를 기준으로 오른쪽부터 보기 때문에 12가 float로 바뀜
		//② double sum = 15.5F ▶ float → double
	} // main()
} // class