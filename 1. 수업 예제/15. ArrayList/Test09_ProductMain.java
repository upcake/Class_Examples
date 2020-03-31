import java.util.ArrayList;

import com.hanul.product.ProductDAO;
import com.hanul.product.ProductDTO;

public class Test09_ProductMain {
	/*
	○ 제품 관리
	1. ProductMain.java 
		- 제품 정보를 저장 ▶ 무한 배열 : ArrayList<>
			# 제품명	단가		수량	 
			# name	cost 	quantity	▶ 멤버 변수(필드) → ProductDTO.java :com.hanul.product package
		- 제품 정보를 입력 : new ProductDTO(~~, ~~, ~~, ~~);
		- 주문 가격을 계산 : getPrice() ▶ 멤버 메서드(기능) → ProductDAO.java : com.hanul.product package
		- 제품 정보를 출력 : display() 
		- 가격의 내림차순 정렬 후 출력 : priceDescSort(), display()
		- 제품명의 오름차순 정렬 후 출력 : nameAscSort(), display()
	2. ProductDTO.java : com.hanul.product package
		- 멤버 변수 선언 : private
		- 디폴트 생성자 메서드
		- 생성자 메서드 초기화 : 멤버 변수를 하나로 묶는다. → 객체화(객체 생성)
		- Getters & Setters 메서드
	3. ProductDAO.java : com.hanul.product package
		- 주문 가격 계산 메서드 : getPrice()
		- 출력 메서드 : display()
		- 가격의 내림차순 정렬 메서드 : priceDescSort()
		- 제품명의 오름차순 정렬 메서드 : nameAscSort()
		
	* 생성자 메소드에 list를 매개 변수로 전달
	* 가격에는 천 단위 구분 기호와 원화를 표시
	*/
	public static void main(String[] args) {
		ArrayList<ProductDTO> list = new ArrayList<>();
		list.add(new ProductDTO("컴퓨터", 500000, 5));
		list.add(new ProductDTO("프린터", 100000, 7));
		list.add(new ProductDTO("노트북", 300000, 5));
		list.add(new ProductDTO("모니터", 300000, 5));
		list.add(new ProductDTO("키보드", 100000, 8));
		
		ProductDAO dao = new ProductDAO(list);
		dao.getPrice();
		dao.display();
		dao.priceDescSort();
		dao.display();
		dao.nameAscSort();
		dao.display();
	} // main()
} // class