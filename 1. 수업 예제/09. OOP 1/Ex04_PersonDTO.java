public class Ex04_PersonDTO {	// 상태정보 저장되는클래스
	// ① 멤버변수(필드) 선언 : 정보은닉 ▶ private
	private String name;	// 이름
	private int age;		// 나이
	private float height;	// 키
	private float weight; 	// 몸무게
	private char gender;	// 성별
	
	// ② 디폴트 생성자 메소드
	public Ex04_PersonDTO() {}
	
	// ③ 생성자 메소드 초기화 : 자동 완성
	public Ex04_PersonDTO(String name, int age, float height, float weight, char gender) {
		super();
		this.name = name;
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.gender = gender;
	}
	
	// ④ Getters & Setteers 메소드 : 자동 완성
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

	public float getHeight() {
		return height;
	}

	public void setHeight(float height) {
		this.height = height;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}
} // class