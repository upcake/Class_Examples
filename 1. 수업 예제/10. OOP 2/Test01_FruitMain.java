import com.hanul.fruit.FruitDAO;
import com.hanul.fruit.FruitDTO;

public class Test01_FruitMain {
/*
○ Test01_FruitMain.java ▶ default package
	- 5종류의 과일 주문 현황을 저장할 객체(FruitDTO) 배열(fruit[]) 생성하고 값을 할당
		[바나나,	3800, 3]
		[딸기, 2000, 6]
		[망고, 4000, 16]
		[천혜향, 3200, 20]
		[사과, 1000, 20]
	- FruitDAO 객체 생성 ▶ 객체 생성ㅅ ㅣ 객체배열(fruit[])을 매개 변수로 전달
		# 가격계산
		# 가격의 내림차순 정렬
		# 출력

○ 상태 정보(FruitDTO.java) : com.hanul.fruit package
	- 멤버 변수 선언
	name	cost	quantity	price
	String	int		int			int
	- 디폴트 생성자 메소드
	- 생성자 메소드 초기화
	- Getters and Setters 메소드

○ 행위 정보(FruitDAO.java) : com.hanul.fruit package
	- getPrice() : 가격계산 메소드
	- priceDescSort() : 가격의 내림차순 정렬 메소드
	- display() : 출력 메소드
*/
	public static void main(String[] args) {
		// 과일 5개 객체 배열 생성 초기화
		FruitDTO[] fruit = new FruitDTO[5];
		fruit[0] = new FruitDTO("바나나", 3800, 3);
		fruit[1] = new FruitDTO("딸기", 2000, 6);
		fruit[2] = new FruitDTO("망고", 4000, 16);
		fruit[3] = new FruitDTO("천혜향", 3200, 20);
		fruit[4] = new FruitDTO("사과", 1000, 20);
		
		FruitDAO dao = new FruitDAO(fruit);
		dao.getPrice();
		dao.priceDescSort();
		dao.display();
	} // main()
} // class