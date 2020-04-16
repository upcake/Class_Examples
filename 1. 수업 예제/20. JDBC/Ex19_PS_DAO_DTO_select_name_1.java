import java.util.Scanner;

import com.hanul.member.MemberDAO;

public class Ex19_PS_DAO_DTO_select_name_1 {
	public static void main(String[] args) {
		// 검색할 이름을 입력 → memberSearchName() 호출 : 검색 결과를 출력
		Scanner scanner = new Scanner(System.in);
		System.out.print("검색할 이름을 입력하세요> ");
		String searchName = scanner.nextLine();
		scanner.close();
		
		MemberDAO dao = new MemberDAO();
		dao.memberSearchName(searchName);
		// 검색 결과가 없으면 아무 메시지가 출력되지 않지만 따로 만들기가 번거롭다.
	} // main()
} // class