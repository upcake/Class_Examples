import java.util.Scanner;

public class SubMenu {
	public void playGame(Character character) {
		Scanner scanner = new Scanner(System.in);
		
		while(true) {
			System.out.println("무엇을 할까요?");
			System.out.print("1. 먹이 주기\t2. 잠 재우기\t3. 놀아주기\t4. 훈련시키기\t5. 종료 ▶ ");
			int menu = Integer.parseInt(scanner.nextLine());
			
			if(menu == 1) {
				character.eat();
			} else if(menu == 2) {
				character.sleep();
			} else if(menu == 3) {
				character.play();
				if(!character.checkEnergy()) {	// ! : 부정(true → false, false → true)
					System.out.println("에너지가 부족해서 캐릭터가 사망했습니다!");
					break;
				}
				character.levelUp();
			} else if(menu == 4) {
				character.train();
				if(!character.checkEnergy()) {	// ! : 부정(true → false, false → true)
					System.out.println("에너지가 부족해서 캐릭터가 사망했습니다!");
					break;
				}
				character.levelUp();
			} else if(menu == 5) {
				System.out.println("게임을 종료합니다!");
				break;
			} else {
				System.out.println("잘못 입력하셨습니다!");
				continue;
			} // if
			character.printInfo();
		} // while
		scanner.close();
	} // playGame()
} // class