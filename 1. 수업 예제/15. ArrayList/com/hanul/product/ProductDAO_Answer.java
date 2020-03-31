package com.hanul.product;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class ProductDAO_Answer {
	private ArrayList<ProductDTO> list;
	public ProductDAO_Answer(ArrayList<ProductDTO> list) {
		this.list = list;
	}

	// 가격 계산
	public void getPrice() {
		for (int i = 0; i < list.size(); i++) {
//			int price = list.get(i).getCost() * list.get(i).getQuantity();
//			list.get(i).setPrice(price);
			list.get(i).setPrice(list.get(i).getCost() * list.get(i).getQuantity());
		}
	} // getPrice()
	
	// 출력
	public void display() {
		DecimalFormat df = new DecimalFormat("￦#,##0");
		for (ProductDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(df.format(dto.getCost()) + "\t");
			System.out.print(dto.getQuantity() + "\t");
			System.out.print(df.format(dto.getPrice()) + "\n");
		}
		System.out.println("===================================");
	} // display()
	
	// 가격 내림차순 정렬
	public void priceDescSort() {
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if(list.get(i).getPrice() < list.get(j).getPrice()) {
					ProductDTO temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				}
			}
		}
	} //priceDescSort()
	
	// 제품명 오름차순 정렬
	public void nameAscSort() {
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if(list.get(i).getName().compareTo(list.get(j).getName()) > 0) {
					ProductDTO temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				}
			}
		}
	} // nameAscSort()
} // class