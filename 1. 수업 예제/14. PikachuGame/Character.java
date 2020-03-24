public abstract class Character {	// 추상 클래스
	// 멤버 변수 선언
	protected int exp;		// 경험치
	protected int energy;	// 에너지
	protected int level;	// 레벨
	
	// 추상 메소드
	public abstract void eat();
	public abstract void sleep();
	public abstract boolean play();		// play(), train() 은 에너지가 감소하기 때문에 죽음 체크를 해야해서 boolean 타입
	public abstract boolean train();
	public abstract void levelUp();
	
	// 에너지 체크
	public boolean checkEnergy() {
		if(energy > 0) {
			return true;
		} else {
			return false;
		}
	} // checkEnergy()
	
	// 현재 캐릭터의 상태를 출력
	public void printInfo() {
		System.out.println("================================");
		System.out.println("현재 캐릭터의 정보를 출력합니다.");
		System.out.println("경험치 : " + exp);
		System.out.println("에너지 : " + energy);
		System.out.println("레벨 : " + level);
		System.out.println("================================");
	} // printInfo()
} // class