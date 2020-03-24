import com.hanul.poly02.Ex02_Animal;
import com.hanul.poly02.Ex02_Cat;
import com.hanul.poly02.Ex02_Dog;

public class Ex02_Poly02main03 {
	public static void main(String[] args) {
		// Dog 객체와 Cat 객체를 생성 : 일반적인 방식
		Ex02_Dog dog = new Ex02_Dog();
		Ex02_Cat cat = new Ex02_Cat();
		
		// 생성된 객체를 배열(animals[])에 저장하시오. ▶ 타입[] 식별자 = { ~~, ~~ }
		Ex02_Animal[] animals = {dog, cat};	// 다형성 배열
		
		for (int i = 0; i < animals.length; i++) {
			animals[i].cry();
			if(animals[i] instanceof Ex02_Cat) {
				((Ex02_Cat)animals[i]).night();
			}
		}
	} // main()
} // class