import java.util.ArrayList;

import com.hanul.fruit.FruitDAO;
import com.hanul.fruit.FruitDTO;

public class Test09_FruitMain {
	/*
	○ 과일 가게 관리
	1. FruitMain.java 
		- 과일 정보를 저장 ▶ 무한 배열 : ArrayList<>
			# 과일명	단가		수량	 
			# name	cost 	quantity	▶ 멤버 변수(필드) → FruitDTO.java :com.hanul.fruit package
		- 과일 정보를 입력 : new FruitDTO(~~, ~~, ~~, ~~);
		- 주문 가격을 계산 : getPrice() ▶ 멤버 메서드(기능) → FruitDAO.java : com.hanul.fruit package
		- 가격의 내림차순 정렬 후 출력 : priceDescSort(), display()
		- 과일 정보를 출력 : display() 

	2. FruitDTO.java : com.hanul.fruit package
		- 멤버 변수 선언 : private
		- 디폴트 생성자 메서드
		- 생성자 메서드 초기화 : 멤버 변수를 하나로 묶는다. → 객체화(객체 생성)
		- Getters & Setters 메서드
	3. FruitDAO.java : com.hanul.fruit package
		- 주문 가격 계산 메서드 : getPrice()
		- 가격의 내림차순 정렬 메서드 : priceDescSort()
		- 출력 메서드 : display()
	*/
	public static void main(String[] args) {
		ArrayList<FruitDTO> list = new ArrayList<>();
		list.add(new FruitDTO("사과", 1500, 32));
		list.add(new FruitDTO("오렌지", 2000, 16));
		list.add(new FruitDTO("배", 6000, 6));
		list.add(new FruitDTO("토마토", 500, 48));
		list.add(new FruitDTO("망고", 5000, 16));
		list.add(new FruitDTO("포도", 3000, 10));
		
		FruitDAO dao = new FruitDAO(list);
		dao.getPrice();
		dao.priceDescSort();
		dao.display();
	} // main()
} // class