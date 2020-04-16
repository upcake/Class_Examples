import java.util.ArrayList;

import com.hanul.member.MemberDAO;
import com.hanul.member.MemberDTO;

public class Ex18_PS_DAO_DTO_select_2 {
	public static void main(String[] args) {
		// 전체 회원 목록을 검색 후 출력 : 전체 회원수가 몇 명인지 알 수 없다 ▶ ArrayList<>
		// memberSearchAll(list) 호출
		ArrayList<MemberDTO> list = new ArrayList<>();
		MemberDAO dao = new MemberDAO();
		dao.memberSearchAll2(list);
	} // main()
} // class