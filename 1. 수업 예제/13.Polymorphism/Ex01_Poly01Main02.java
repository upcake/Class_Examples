import com.hanul.poly01.Ex01_Animal;
import com.hanul.poly01.Ex01_Cat;
import com.hanul.poly01.Ex01_Dog;

public class Ex01_Poly01Main02 {
	public static void main(String[] args) {
		Ex01_Dog dog = new Ex01_Dog();	// 일반적인 객체 생성 방법 : A a = new A();
		dog.cry();
		
		Ex01_Animal animal = new Ex01_Cat();	// 업캐스팅(UpCasting) → 다형성
		animal.cry();							// 부모 클래스가 동작을 시킨다
//		animal.night();		// 오류 발생 : Ex01_Animal 클래스에는 night() 메소드가 없다.
		
		Ex01_Cat cat = (Ex01_Cat)animal;		// 다운캐스팅(DownCasting)
		cat.night();
		((Ex01_Cat)animal).night();
	} // main()
} // class

/*
○ 객체를 생성하는 방법
	- Dog dog = new Dog();			▶ 일반적인 방식
	- Animal animal = new Dog();	▶ 업캐스팅(UpCasting) → 다형성
	
○ 다형성의 전제 조건
	- 상속 관계 :public class 자식 클래스(B) extends 부모 클래스(A) ▶ B → A
	- Override 필수 : 자식 클래스(B)에서는 부모 클래스(A)의 기능(메소드)을 재정의 필수
	- UpCasting으로 객체를 생성(부모 클래스 쪽으로할당한다) : A a = new B();
*/