package sec01;

public class Ex05_ClassCastExceptionExample {
	public static void main(String[] args) {
		Dog dog = new Dog();
		changeDog(dog);
		
		Cat cat = new Cat();
		changeDog(cat);
	} // main()
	
	public static void changeDog(Animal animal) {
//		if(animal instanceof Dog) {
			Dog dog = (Dog) animal;	// ClassCastException 발생 가능
//		} // if
	} // changeDog()
} // class

class Animal {}
class Dog extends Animal {}
class Cat extends Animal {}