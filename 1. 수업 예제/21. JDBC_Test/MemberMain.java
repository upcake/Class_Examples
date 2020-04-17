import java.util.Scanner;

import com.hanul.member.MemberDAO;
import com.hanul.member.MenuInput;

public class MemberMain {
	public static void menuPrint() {
		System.out.println("=====회원 관리=====");
		System.out.println("회원 정보 입력 : I");
		System.out.println("회원 정보 수정 : U");
		System.out.println("회원 정보 삭제 : D");
//		System.out.println("회원 정보 검색 : S");	// searchAllInput()		→	memberSearchAll()
//		System.out.println("회원 이름 검색 : N");	// searchNameInput()	→	memberSearchName()
//		System.out.println("회원 주소 검색 : A");	// searchAddrInput()	→	memberSearchAddr()
//		System.out.println("회원 전번 검색 : T");	// searchTelInput()		→	memberSearchTel()
		System.out.println("회원 관리 종료 : E");
		System.out.println("===================");
	} // menuPrint()
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		MenuInput input = new MenuInput(scanner);
		
		while(true) {
			menuPrint();
			System.out.print("메뉴를 입력하세요> ");
			String menu = scanner.nextLine();
			
			if(menu.equalsIgnoreCase("i")) {
//				System.out.println("신규 회원 등록 화면");
				input.insertInput();	// 회원 정보 입력 및 등록 서브 화면
			} else if (menu.equalsIgnoreCase("u")) {
				input.updateInput();	// 회원 정보 수정하는 서브 화면
			} else if (menu.equalsIgnoreCase("d")) {	
				input.deleteInput();	// 회원 정보 삭제하는 서브 화면
			} else if(menu.equalsIgnoreCase("e")) {
				System.out.print("정말 종료하시겠습니까? (Y/N)> ");
				String exit = scanner.nextLine();
				if (exit.equalsIgnoreCase("y")) {
					System.out.println("회원 관리 프로그램을 종료합니다.");
					MemberDAO dao = new MemberDAO();
					dao.dbClose();
					System.exit(0);
					break;
				} else if(exit.equalsIgnoreCase("n")) {
					continue;
				} else {
					System.out.println("메뉴를 잘못 입력하셨습니다!");
					continue;
				}
			} else {
				System.out.println("메뉴를 잘못 입력하셨습니다!");
				continue;
			}
		}
		scanner.close();
	} // main()
} // class