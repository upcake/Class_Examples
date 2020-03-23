import com.hanul.student.StudentDAO;
import com.hanul.student.StudentDTO;

public class Test02_StudentMain {
/*
○ StudentMain.Java ▶ default package
	- 학생 3명의 성적을 처리할 객체(StudentDTO) 배열(student[])을 생성하고 값을 할당
 		[홍길동, 2020001, 컴공과, 95.4, 90.3]
 		[김길동, 2020002, 정통과, 80.7, 85.6]
 		[나길동, 2020003, 전산과, 85, 97.8]
 	- StudentDAO 객체 생성 ▶ 객체 생성 시 객체배열(student[])을 매개변수로 전달
 	 # 총점 계산	# 평균 계산		# 총점의 내림차순으로 정렬	# 출력
 	 # 이름의 오름차순으로 정렬	#출력
○ 상태정보(StudentDTO.java) : com.hanul.student package
	- 멤버변수 선언
	name	num		major	cpp		java
	String	int		String	float	float
	- 디폴트 생성자 메소드
	- 생성자 메소드 초기화
	- Getters and Setters 메소드
○ 행위정보(StudentDAO.java) : com.hanul.student package
	- getSum() : 총점 계산 메소드
	- getAvg() : 평균 계산 메소드
	- sumDescSort() : 총점의 내림차순 정렬
	- display() : 출력 메소드 ▶ 단, 평균은 소수 첫째자리까지 표시한다
	- nameAscSort() : 이름의 오름차순 정렬 ▶ compareTo() 사용
○ 출력 예시
이름		학번		학과		C++		JAVA	총점		평균
====================================================
XXX		XXX		XXX		XX.X	XX.X	XX.X	XX.X
*/	
	public static void main(String[] args) {
		StudentDTO[] stdnt = new StudentDTO[3];
		stdnt[0] = new StudentDTO(2020001, "홍길동", "컴공과", 95.4F, 90.3F);
		stdnt[1] = new StudentDTO(2020002, "김길동", "정통과", 80.7F, 85.6F);
		stdnt[2] = new StudentDTO(2020003, "나길동", "전산과", 85F, 97.8F);
		
		StudentDAO dao = new StudentDAO(stdnt);
		dao.getSum();
		dao.getAvg();
		dao.sumDescSort();
		dao.display();
		dao.nameAscSort();
		dao.display();
	} // main()
} // class