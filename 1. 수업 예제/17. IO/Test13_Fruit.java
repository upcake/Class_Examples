import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;

import com.hanul.study.FruitDAO;
import com.hanul.study.FruitDTO;

public class Test13_Fruit {
	/*
	○ Fruit.txt ▶ IO Project
	사과		3000	17
	바나나	3500	10
	포도		5000	8
	수박		20000	3
	오렌지	2000	10
	========================================		
	
	○ FruitResult.txt ▶ IO Project
	제품명	단가		수량	가격
	XXX		￦X,XXX	XX	￦X,XXX
	XXX		￦X,XXX	XX	￦X,XXX
	========================================
	
	○ FruitMain.java ▶ default package
		- Fruit.txt 파일의 내용을 라인 단위로 읽어서
		- FruitResult.txt 파일에 출력하시오.
		- 각 라인의 항목은 TAB("\t")으로 구분되어 있다.
		- 가격을 계산하시오(단가 * 수량)
		- 가격의 내림차순으로 정렬한 후 출력(저장)하시오.
		- 필요 시 화면에 출력하시오.
		- FileReader, BufferedReader
		- FileWriter, BufferedWriter
		- FruitDTO, ArrayList<FruitDTO>
		
		- 파일의 입력을 위한 준비 단계
		- 열려진 파일의 내용을 읽어(readLine())서 저장할 변수를 초기화
		- TAB으로 split()한 후, FruitDTO 객체 생성
		- ArrayList(<FruitDTO> 객체 생성
	
	○ FruitDTO.java ▶ com.hanul.study package
		- 멤버 변수 선언(name, cost, quantity, price)
		- 디폴트 생성자 메서드
		- 생성자 메서드 초기화
		- Getter & Setters 메서드
	
	○ FruitDAO.java ▶ com.hanul.study package
		- ArrayList<>를 매개 변수로 전달 받는 생성자
		- 가격 계산 : getPrice()
		- 화면 출력 : display()
		- 가격의 내림차순 정렬 : priceDescSort()
		- 파일 출력(저장) : fileSave()
	 */
	public static void main(String[] args) {
		try {
			String inputPath = "D:\\Study_Java\\workspace\\17. IO\\Fruit.txt";
			FileReader fr = new FileReader(inputPath);
			BufferedReader br = new BufferedReader(fr);
			
			String line = null;
			FruitDTO dto = null;
			ArrayList<FruitDTO> list = new ArrayList<>();
			
			while((line = br.readLine()) != null) {
				String[] sp = line.split("\t");
				dto = new FruitDTO(sp[0], Integer.parseInt(sp[1]), Integer.parseInt(sp[2]));
				list.add(dto);
			}
			
			FruitDAO dao = new FruitDAO(list);
			dao.getPrice();
			dao.display();
			dao.priceDescSort();
			dao.display();
			dao.fileSave();
			
			br.close();
			fr.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // try catch
	} // main()
} // class