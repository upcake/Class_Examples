import com.hanul.poly01.Ex01_Animal;
import com.hanul.poly01.Ex01_Cat;
import com.hanul.poly01.Ex01_Dog;

public class Ex01_Poly01Main01 {
	// Ex01_Dog 객체를 생성하고 cry() 메소드를 호출하시오.
	public static void main(String[] args) {
		// 상황 1 : Ex01_Dog 클래스를 자신이 직접 만들었다.
		// Ex01_Dog 클래스 안에 무슨 동작이 있고, 그 동작이 어떻게 구동 되는지 알고 있다.
		Ex01_Dog dog = new Ex01_Dog();
		dog.cry();
		
		// 상황 2 : Ex01_Dog 클래스를 다른 사람이 만들어서 나에게 주었다(Ex01_Dog.class)
		// Ex01_Dog 클래스 안에 무슨 동작이 있고, 어떻게 구동 되는지 알 수가 없다.
		
		// 상황 3 : Ex01_Dog 클래스와 Ex01_Animal 클래스를 나에게 주었다.
		// Ex01_Animal 클래스가 상위 클래스이고 cry() 메소드를 정의했고,
		// Ex01_Dog 클래스가 하위 클래스기옥 cry() 메소드를 재정의(Override)했다고 알려줌
		// 객체 생성 : 부모 클래스 쪽으로 객체 생성 ▶ 업캐스팅(UpCasting) : 다형성이 발생
		Ex01_Animal animal = new Ex01_Dog();
		animal.cry();
		
		animal = new Ex01_Cat();
		animal.cry();
//		animal.night();	// 동작되지 않는다 : 부모 클래스(Ex01_Animal)는 night() 메소드가 없다.
		
		Ex01_Cat cat = new Ex01_Cat();
		cat.night();
		
		// A a = new A(); 일반적인 객체 생성
		// A a = new B(); 다형성(UpCasting) : B(하위) → A(상위)
		
	} // main()
} // class