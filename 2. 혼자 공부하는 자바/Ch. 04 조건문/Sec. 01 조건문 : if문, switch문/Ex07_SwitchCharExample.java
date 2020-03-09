package sec01;

public class Ex07_SwitchCharExample {
	public static void main(String[] args) {
		// char 타입의 switch문
		char grade = 'B';
		
		switch(grade) {
			case 'A' :
			case 'a' :
				System.out.println("우수 회원입니다.");
				break;
			case 'B' :
			case 'b' :
				System.out.println("일반 회원입니다.");
				break;
			default :
				System.out.println("손님입니다.");
		} // switch
	} // main()
} // class