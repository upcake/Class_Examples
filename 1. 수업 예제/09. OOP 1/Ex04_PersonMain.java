public class Ex04_PersonMain {
	/*
	○ 회원관리 
		- 3명의 회원 정보를 저장할 객체배열 생성하고 값을 할당 ▶ Ex04_PersonDTO.java
		[홍길동, 33, 175.5, 75, M]
		[나길동, 30, 178, 66.5, M]
		[성춘향, 28, 165, 48.5, F]
		- 객체배열의 내용을 출력 ▶ Ex04_PersonDAO.java
	
	○ 상태정보(Ex04_PersonDTO.java)
	 - 멤버 변수 선언
	name	age		height	weight	gender
	String	int		float	float	char
	 - 디폴트 생성자 메소드
	 - 생성자 메소드 초기화
	 - Getters and Setters 메소드
	
	○ 행위정보(Ex04_PersonDAO.java)
	 - display() : 출력 메소드
	*/ 
	public static void main(String[] args) {
		// 3명의 회원 정보를 저장할 객체(Ex04_PersonDTO.java)배열(person[]) 생성하고 값을 할당
		Ex04_PersonDTO[] person = new Ex04_PersonDTO[3];
		person[0] = new Ex04_PersonDTO("홍길동", 33, 175.5F, 75F, 'M');
		person[1] = new Ex04_PersonDTO("나길동", 30, 178F, 66.5F, 'M');
		person[2] = new Ex04_PersonDTO("성춘향", 28, 165F, 48.5F, 'F');
		
		// 객체배열의 내용을 출력(display()) : Ex04_PersonDAO.java
		Ex04_PersonDAO dao = new Ex04_PersonDAO();
		dao.display(person);
		dao.ageAscSort(person); // 나이의 오름차순 정렬
		dao.display(person);
		dao.heightDescSort(person);	// 키의 내림차순 정렬
		dao.display(person);
	} // main()
} // class