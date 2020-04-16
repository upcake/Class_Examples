import java.util.ArrayList;
import java.util.Scanner;

import com.hanul.member.MemberDAO;
import com.hanul.member.MemberDTO;

public class Ex19_PS_DAO_DTO_select_name_2 {
	public static void main(String[] args) {
		// 검색할 이름을 입력 : 전체 회원수가 몇 명인지 알 수 없다 ▶ ArrayList<>
		// memberSearchName(list, searchName) 호출 : 검색 결과를 출력
		Scanner scanner = new Scanner(System.in);
		System.out.print("검색할 이름을 입력하세요> ");
		String searchName = scanner.nextLine();
		scanner.close();
		
		ArrayList<MemberDTO> list = new ArrayList<>();
		MemberDAO dao = new MemberDAO();
		dao.memberSearchName(list, searchName);
	} // main()
} // class