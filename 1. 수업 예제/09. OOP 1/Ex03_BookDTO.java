// 상태정보(멤버변수, 필드)를 저장하는 Class
// 서로 다른 타입의 데이터를 하나로 묶기 위해 설계
public class Ex03_BookDTO {
	// ① 멤버변수 선언 ▶ 정보은닉(캡슐화) : private
	private String title;	// 제목
	private int price;		// 가격
	private String company;	// 출판사
	private String name;	// 저자
	
	// ② 기본 생성자 메소드(Default Constructor Method)
	// 클래스의 이름과 메소드의 이름이 동일, 리턴 타입이 없다.
	// 전달되는 매개 변수와 구현부(body{})가 없다. : 빈 깡통
	// 생략 가능 → JVM이 자동으로 생성 ▶ 단, DTO(VO) Class 설계 시 반드시 만들어 주자!
	public Ex03_BookDTO() {}

	// ③ 선언된 멤버 변수로 값을 할당하기 위해, 전달되는 매개 변수를 초기화하는 생성자 메소드 정의
	// 이클립스에서 자동으로 제공 : 상단 메뉴 바 Source or 우클릭 Source → Generate Constructor using Fields
	public Ex03_BookDTO(String title, int price, String company, String name) {
		super();				// 부모(상위) 클래스를 호출 : JAVA의 모든 클래스는 Object Class 무조건 상속
		this.title = title;		// 갈색 = 매개 변수 를 파랑색 = 멤버 변수에 주겠다.
		this.price = price;		// 매개 변수와 멤버 변수를 구분하기 위해 멤버 변수 앞에 this 키워드
		this.company = company;	// 멤버 변수 : 현재 클래스 안에서만 사용되는 변수, 매개 변수 : 메소드에서 전달되는 변수
		this.name = name;
	}

	// ④ 입력(Setter), 출력(Getter) 메소드를 정의 : 멤버 변수에 접근
	// 이클립스에서 자동으로 제공 : Source → Generate Setters and Getters
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
} // class