package com.hanul.fruit;

public class FruitDAO {

	private FruitDTO[] fruit;
	public FruitDAO(FruitDTO[] fruit) {
		this.fruit = fruit;
	}
	
	// 가격 계산
	public void getPrice() {
		for (int i = 0; i < fruit.length; i++) {
			fruit[i].setPrice(fruit[i].getCost() * fruit[i].getQuantity()); 
		} // for
	} // getPrice()
	
	// 가격 내림차순 정렬
	public void priceDescSort() {
		for (int i = 0; i < fruit.length; i++) {
			for (int j = i + 1; j < fruit.length; j++) {
				if(fruit[i].getPrice() < fruit[j].getPrice()) {
					FruitDTO temp = fruit[i];
					fruit[i] = fruit[j];
					fruit[j] = temp;
				} // if
			} // for j
		} // for i
	} // priceDescSort()
	
	// 출력
	public void display() {
		System.out.println("이름\t단가\t수량\t가격");
		System.out.println("=============================");
		for (int i = 0; i < fruit.length; i++) {
			System.out.print(fruit[i].getName() + "\t");
			System.out.print(fruit[i].getCost() + "\t");
			System.out.print(fruit[i].getQuantity() + "\t");
			System.out.print(fruit[i].getPrice() + "\n");
		}
	}
}
