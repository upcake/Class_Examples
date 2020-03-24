import java.util.Scanner;

public class GameMain {
	public static void main(String[] args) {
		Character character = null;
		SubMenu sm = new SubMenu();
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("원하는 캐릭터를 선택하세요!");
		System.out.print("1. 피카츄\t2. 이상해씨\t3. 꼬부기 ▶ ");
		
		int c = Integer.parseInt(scanner.nextLine());
		if(c == 1) {
			character = new Pikachu();
			sm.playGame(character);
		} else if(c == 2) {
			character = new Bulbasaur();
			sm.playGame(character);
		} else if(c == 3) {
			character = new Squirtle();
			sm.playGame(character);
		} else {
			System.out.println("잘못 입력하셨습니다!");
		}
		
		scanner.close();
	} // main()
} // class