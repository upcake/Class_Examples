public class Ex02_Animal {	// 부모 클래스 : 상태정보(멤버 변수, 필드) → DTO, VO
	private String name;
	private int age;
	
	public Ex02_Animal () {}

	public Ex02_Animal(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

}