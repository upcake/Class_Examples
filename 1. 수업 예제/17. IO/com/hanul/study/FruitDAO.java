package com.hanul.study;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;

public class FruitDAO {

	private ArrayList<FruitDTO> list;
	public FruitDAO(ArrayList<FruitDTO> list) {
		super();
		this.list = list;
	}
	
	public void getPrice() {
//		for (int i = 0; i < list.size(); i++) {
//			list.get(i).setPrice(list.get(i).getQuantity() * list.get(i).getCost());
//		}
		for (FruitDTO dto : list) {
			dto.setPrice(dto.getQuantity() * dto.getCost());
		}
	}

	public void display() {
		DecimalFormat df = new DecimalFormat("￦#,##0");
		System.out.println("제품명\t단가\t수량\t가격");
		for (FruitDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(df.format(dto.getCost()) + "\t");
			System.out.print(dto.getQuantity() + "\t");
			System.out.print(df.format(dto.getPrice()) + "\n");
		}
		System.out.println("===================================");
	}

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
	}

	public void fileSave() {
		try {
			String outputPath = "D:\\Study_Java\\workspace\\17. IO\\FruitResult.txt";
			FileWriter fw = new FileWriter(outputPath);
			BufferedWriter bw = new BufferedWriter(fw);
			DecimalFormat df = new DecimalFormat("￦#,##0");
			
			bw.write("제품명\t단가\t수량\t가격\n");
			bw.flush();
			
			int index = 0;
			for (FruitDTO dto : list) {
				if(index < list.size() -1) {
					String line = dto.getName() + "\t" + df.format(dto.getCost()) + "\t" + dto.getQuantity() + "\t" + df.format(dto.getPrice()) + "\n";
					index++;
					bw.write(line);
					bw.flush();
					System.out.println();
				} else {
					String line = dto.getName() + "\t" + df.format(dto.getCost()) + "\t" + dto.getQuantity() + "\t" + df.format(dto.getPrice()) + "\n";
					bw.write(line);
					bw.flush();
					System.out.println();
				}
			} // for
			bw.close();
			fw.close();
			} catch (Exception e) {
			e.printStackTrace();
			} // try catch
	} // fileSave()
} // class