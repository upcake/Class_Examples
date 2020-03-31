import java.util.ArrayList;

import com.hanul.member.MemberDTO;

public class Ex09_ForEachMain03 {
	public static void main(String[] args) {
		// 회원 정보(MemberDTO)를 ArrayList<>에 저장하시오.
		ArrayList<MemberDTO> list = new ArrayList<>();
		list.add(new MemberDTO("홍길동", 27, "광주시 서구 농성동", "010-1111-1111"));
		list.add(new MemberDTO("김길동", 29, "광주시 서구 쌍촌동", "010-2222-2222"));

		// ArrayList<> 값을 출력 : 교환 전
		for (MemberDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
		}
		System.out.println("=============================================");
		
		// Swap : 서로 자리 바꿈(교환) → 임시변수(temp), set()
		MemberDTO temp = list.get(0);
		list.set(0, list.get(1));
		list.set(1, temp);
		
		// ArrayList<> 값을 출력 : 교환 후
		for (MemberDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
		}
		System.out.println("=============================================");
	} // main()
} // class