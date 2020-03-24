import com.hanul.poly02.Ex02_Animal;
import com.hanul.poly02.Ex02_Cat;
import com.hanul.poly02.Ex02_Dog;

public class Ex02_Poly02main02 {
	public static void main(String[] args) {
		Ex02_Dog dog = new Ex02_Dog();
		Ex02_Cat cat = new Ex02_Cat();
		
		display(dog);	// 실인수
		display(cat);
	} // main()
	
//	public static void display(Ex02_Cat cat) {}	▶	Ex02_Dog → Ex02_Animal 
//	public static void display(Ex02_Dog dog) {}	▶	Ex02_Cat → Ex02_Animal
	public static void display(Ex02_Animal animal) {	// 가인수 : 다형성 인수
//	실인수와 가인수의 타입이 다르더라도 실인수가 자식, 가인수가 부모면 작동된다.
		animal.cry();
//		animal.night();	// 오류 : Ex02_Animal 클래스에는 night() 메소드가 없다
//		((Ex02_Cat)animal).night();		// DonwCasting : 예외 발생
		
//		Ex02_Cat Class Type으로 인수값이 전달된 경우에만 night() 메소드가 동작
		if(animal instanceof Ex02_Cat) {	// instanceof : 타입(클래스)을 정확하게 알아본다
			((Ex02_Cat)animal).night();
		} // if
	} // display()
} // class