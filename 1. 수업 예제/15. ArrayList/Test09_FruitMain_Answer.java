import java.util.ArrayList;

import com.hanul.fruit.FruitDAO_Answer;
import com.hanul.fruit.FruitDTO;

public class Test09_FruitMain_Answer {
	public static void main(String[] args) {
		ArrayList<FruitDTO> list = new ArrayList<>();
		list.add(new FruitDTO("사과", 1500, 32));
		list.add(new FruitDTO("오렌지", 2000, 16));
		list.add(new FruitDTO("배", 6000, 6));
		list.add(new FruitDTO("토마토", 500, 40));
		list.add(new FruitDTO("포도", 3000, 10));
		list.add(new FruitDTO("망고", 5000, 16));
		
		FruitDAO_Answer dao = new FruitDAO_Answer(list);
		dao.getPrice();
		dao.priceDescSort();
		dao.display();
		dao.printf();
		dao.printfs();
	} // main()
} // class