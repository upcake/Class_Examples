import java.util.Scanner;

import com.hanul.member.MemberDAO;
import com.hanul.member.MemberDTO;

public class Ex17_PS_DAO_DTO_update {
	public static void main(String[] args) {
		// 수정할 회원 정보를 입력 → memberUpdate() 호출 ▶ 해당 번호의 레코드를 갱신(수정)
		Scanner scanner = new Scanner(System.in);
		System.out.print("수정할 회원 번호를 입력하세요> ");
		int num = Integer.parseInt(scanner.nextLine());
		System.out.print("수정할 회원의 이름을 입력하세요> ");
		String name = scanner.nextLine();
		System.out.print("수정할 회원의 나이를 입력하세요> ");
		int age = Integer.parseInt(scanner.nextLine());
		System.out.print("수정할 회원의 주소를 입력하세요> ");
		String addr = scanner.nextLine();
		System.out.print("수정할 회원의 전화번호를 입력하세요> ");
		String tel = scanner.nextLine();
		scanner.close();
		
		MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
		MemberDAO dao = new MemberDAO();
		int succ = dao.memberUpdate(dto);
		if (succ > 0) {
			System.out.println(num + "번 회원 정보가 갱신되었습니다.");
		} else {
			System.out.println(num + "번 회원 정보가 없습니다.");
		}
	} // main()
} // class