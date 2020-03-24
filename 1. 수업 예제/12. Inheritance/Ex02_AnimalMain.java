public class Ex02_AnimalMain {
	public static void main(String[] args) {
		Ex02_Dog dog = new Ex02_Dog("멍멍이", 3);	// Dog 객체를 생성하고 초기화
		Ex02_Cat cat = new Ex02_Cat("야옹이", 2);	// Cat 객체를 생성하고 초기화
		
		System.out.println("강아지 이름 : " + dog.getName() + "\t나이 : " + dog.getAge());
		System.out.println("고양이 이름 : " + cat.getName() + "\t나이 : " + cat.getAge());
		
		dog.setName("방울이");
		dog.setAge(4);
		System.out.println("강아지 이름 : " + dog.getName() + "\t나이 : " + dog.getAge());

		cat.setName("달봉이");
		cat.setAge(4);
		System.out.println("고양이 이름 : " + cat.getName() + "\t나이 : " + cat.getAge());
	} // main()
} // class