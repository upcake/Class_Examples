package com.hanul.fruit;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class FruitDAO_Answer {

	private ArrayList<FruitDTO> list;
	public FruitDAO_Answer(ArrayList<FruitDTO> list) {
		this.list = list;
	}

	// 가격 계산
	public void getPrice() {
		for (FruitDTO dto : list) {
			dto.setPrice(dto.getCost() * dto.getQuantity());
		}
	} // getPrice()

	// 가격 내림차순 정렬
	public void priceDescSort() {
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if(list.get(i).getPrice() < list.get(j).getPrice()) {
					FruitDTO temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				}
			}
		}
	} // priceDescSort()

	// 출력
	public void display() {
		DecimalFormat df = new DecimalFormat("￦#,##0");
		for (FruitDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(df.format(dto.getCost()) + "\t");
			System.out.print(dto.getQuantity() + "\t");
			System.out.print(df.format(dto.getPrice()) + "\n");
		}
		System.out.println("=========================================");
	} // display()
	
	public void printf() {
		for (FruitDTO dto : list) {
			String name = dto.getName();
			int cost = dto.getCost();
			int quantity = dto.getQuantity();
			int price = dto.getPrice();
			System.out.printf("%1$-10s\t%2$6d%3$6d%4$6d\n", name, cost, quantity, price);
		}
		System.out.println("=========================================");
	} // printf()
	
	public void printfs() {
		DecimalFormat df = new DecimalFormat("￦#,##0");
		for (FruitDTO dto : list) {
			String name = dto.getName();
			String cost = df.format(dto.getCost());
			int quantity = dto.getQuantity();
			String price = df.format(dto.getPrice());
			System.out.printf("%1$-10s\t%2$10s%3$10d%4$10s\n", name, cost, quantity, price);
		}
	} // printfs()
}
/*
printf("형식문자열", 값);

 %d : 정수
 %s : 문자열
 %f : 실수
 
순번부여 : 숫자$

 "%1$s %2$d %3$d %4$d", name, cost, quantity, price
 */