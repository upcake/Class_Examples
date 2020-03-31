package com.hanul.fruit;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class FruitDAO {

	private ArrayList<FruitDTO> list;
	public FruitDAO(ArrayList<FruitDTO> list) {
		this.list = list;
	}
	
	public void getPrice() {
		for (FruitDTO dto : list) {
			dto.setPrice(dto.getCost() * dto.getQuantity());
		}
	}
	
	public void priceDescSort() {
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if (list.get(i).getPrice() < list.get(j).getPrice()) {
					FruitDTO temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				}
			}
		}
	}
	
	public void display() {
		DecimalFormat df = new DecimalFormat("￦#,##0");
		System.out.println("과일명\t단가\t수량\t가격");
		System.out.println("==============================");
		for (int i = 0; i < list.size(); i++) {
			System.out.print(list.get(i).getName() + "\t");
			System.out.print(df.format(list.get(i).getCost()) + "\t");
			System.out.print(list.get(i).getQuantity() + "\t");
			System.out.print(df.format(list.get(i).getPrice()) + "\n");
		}
	}
}