import java.util.ArrayList;

import com.hanul.product.ProductDAO_Answer;
import com.hanul.product.ProductDTO;

public class Test09_ProductMain_Answer {
	public static void main(String[] args) {
		ArrayList<ProductDTO> list = new ArrayList<>();
		list.add(new ProductDTO("컴퓨터", 500000, 5));
		list.add(new ProductDTO("프린터", 100000, 7));
		list.add(new ProductDTO("노트북", 300000, 5));
		list.add(new ProductDTO("모니터", 300000, 5));
		list.add(new ProductDTO("키보드", 100000, 8));
		
		ProductDAO_Answer dao = new ProductDAO_Answer(list);
		dao.getPrice();
		dao.display();
		dao.priceDescSort();
		dao.display();
		dao.nameAscSort();
		dao.display();
	} // main()
} // class