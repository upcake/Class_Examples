import java.util.ArrayList;
import java.util.Scanner;

import com.hanul.member.MemberDAO;
import com.hanul.member.MemberDTO;

public class Ex19_PS_DAO_DTO_select_name_3 {
	public static void main(String[] args) {
		// 검색할 이름을 입력 : 전체 회원수가 몇 명인지 알 수 없다 ▶ ArrayList<>
		// memberSearchName3(list, searchName) 호출 → 결과를 return 받아 출력
		Scanner scanner = new Scanner(System.in);
		System.out.print("검색할 이름을 입력하세요> ");
		String searchName = scanner.nextLine();
		scanner.close();
		
		ArrayList<MemberDTO> list = new ArrayList<>();
		MemberDAO dao = new MemberDAO();
		list = dao.memberSearchName3(list, searchName);
		
		// list의 내용을 출력
		if (list.size() == 0) {
			System.out.println("검색된 결과가 없습니다.");
		} else {
			for (MemberDTO dto : list) {
				System.out.print(dto.getNum() + "\t");
				System.out.print(dto.getName() + "\t");
				System.out.print(dto.getAge() + "\t");
				System.out.print(dto.getAddr() + "\t");
				System.out.print(dto.getTel() + "\n");
			}
		}
	} // main()
} // class