import java.util.ArrayList;

import com.hanul.member.MemberDAO;
import com.hanul.member.MemberDTO;

public class Ex07_MemberMain {
/*
○ 회원 관리
1. MemberMain.java 
	- 회원 정보를 저장 ▶ 무한 배열 : ArrayList<>
		# 이름	나이	주소		전화번호 
		# name	age	addr	tel		▶ 멤버 변수(필드) → MemberDTO.java :com.hanul.member package
	- 회원 정보를 입력 : new MemberDTO(~~, ~~, ~~, ~~);
	- 회원 정보를 출력 : display() ▶ 멤버 메서드(기능) → MemberDAO.java : com.hanul.member package
	- 나이의 오름차순 정렬 후 출력 : ageAscSort(), display()
2. MemberDTO.java : com.hanul.member package
	- 멤버 변수 선언
	- 디폴트 생성자 메서드
	- 생성자 메서드 초기화 : 멤버 변수를 하나로 묶는다. → 객체화(객체 생성)
	- Getters & Setters 메서드
3. MemberDAO.java : com.hanul.member package
	- 출력 메서드 : display()
	- 나이의 오름차순 정렬 메소드 : ageAscSort()
*/
	public static void main(String[] args) {
		// 회원 정보(MemberDTO)를 ArrayList<>에 저장하시오.
		ArrayList<MemberDTO> list = new ArrayList<>();
		list.add(new MemberDTO("홍길동", 27, "광주시 서구 농성동", "010-1111-1111"));
		list.add(new MemberDTO("김길동", 29, "광주시 서구 쌍촌동", "010-2222-2222"));
		list.add(new MemberDTO("나길동", 25, "광주시 남구 봉선동", "010-3333-3333"));
		
		// 회원 정보(ArrayList<>)를 출력 : display() ▶ MemberDAO.java
		MemberDAO dao = new MemberDAO();
		dao.display(list);
		
		// 회원 정보(ArrayList<>)의 내용을 나이의 오름차순으로 정렬 후 출력
		dao.ageAscSort(list);
		dao.display(list);
		
		// 성명의 내림차순 정렬 후 출력
		dao.nameDescSort(list);
		dao.display(list);
	} // main()
} // class