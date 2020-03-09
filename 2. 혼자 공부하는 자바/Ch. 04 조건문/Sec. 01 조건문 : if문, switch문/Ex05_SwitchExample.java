package sec01;

public class Ex05_SwitchExample {
	public static void main(String[] args) {
		//switch문
		int num = (int) (Math.random() * 6) + 1;	// 주사위 번호 하나 뽑기
		
		switch(num) {
			case 1 :
				System.out.println("1번이 나왔습니다.");
				break;
			case 2 :
				System.out.println("2번이 나왔습니다.");
				break;
			case 3 :
				System.out.println("3번이 나왔습니다.");
				break;
			case 4 :
				System.out.println("4번이 나왔습니다.");
				break;
			case 5 :
				System.out.println("5번이 나왔습니다.");
				break;
			default :
				System.out.println("6번이 나왔습니다.");
				break;
		} // switch
	} // main()
} // class