package com.hanul.product;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class ProductDAO {
	private ArrayList<ProductDTO> list;
	public ProductDAO(ArrayList<ProductDTO> list) {
		this.list = list;
	}

	public void getPrice() {
		for (ProductDTO dto : list) {
			dto.setPrice(dto.getCost() * dto.getQuantity());
		}
	} // getPrice()

	public void display() {
		DecimalFormat df = new DecimalFormat("￦#,##0");
		System.out.println("제품명\t단가\t수량\t가격");
		System.out.println("================================");
		for (ProductDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(df.format(dto.getCost()) + "\t");
			System.out.print(dto.getQuantity() + "\t");
			System.out.print(df.format(dto.getPrice()) + "\n");
		}
		System.out.println("================================");
	} // display()

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
	} // pirceDescSort()

	public void nameAscSort() {
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < list.size(); j++) {
				if(list.get(i).getName().compareTo(list.get(j).getName()) < 0) {
					ProductDTO temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				}
			}
		}
	} // nameAscSort()	
} // class