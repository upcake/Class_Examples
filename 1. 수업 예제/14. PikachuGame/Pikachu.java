public class Pikachu extends Character {	// 상속 : Pikachu → Character
	public Pikachu() {	// 디폴트 생성자 메소드 : 경험치, 에너지, 레벨 초기화
		exp = 30;
		energy = 50;
		level = 0;
		System.out.println("피카츄 캐릭터가 생성되었습니다.");
		printInfo();
	} // Pikachu()

	@Override
	public void eat() {
		energy += 10;
	}

	@Override
	public void sleep() {
		energy += 5;
	}

	@Override
	public boolean play() {
		energy -= 20;
		exp += 5;
		return checkEnergy();
	}

	@Override
	public boolean train() {
		energy -= 10;
		exp += 15;
		return checkEnergy();
	}

	@Override
	public void levelUp() {
		if(exp >= 40) {
			level++;
			exp -= 40;
			System.out.println("레벨업 되었습니다.");
		}
	}
} // class