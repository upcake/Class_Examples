package com.hanul.study;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Scanner;

public class FinalTestDAO {

	FinalTestDTO dto = null;
	ArrayList<FinalTestDTO> list = new ArrayList<>();
	FileWriter fw = null;
	BufferedWriter bw = null;
	DecimalFormat df = null;
	
	public FinalTestDAO() {}

	public void getScore() {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("성적 처리 할 학생 수를 입력하세요> ");
		int studentNum = Integer.parseInt(scanner.nextLine());
		
		for (int i = 1; i <= studentNum; i++) {
			dto = new FinalTestDTO();
			dto.setNum(i);			
		
			System.out.print(i + "번 학생의 이름을 입력하세요> ");
			dto.setName(scanner.nextLine());

			while(true) {				
				System.out.print((i) + "번 학생의 국어 점수를 입력하세요> ");
				dto.setKor(Integer.parseInt(scanner.nextLine()));
				if((dto.getKor() < 0) || (dto.getKor() > 100)) {
					System.out.println("국어 점수의 입력 범위는 0 ~ 100까지 입니다!");
					continue;
				} else {
					break;
				}
			} // while kor
			
			while(true) {
				System.out.print((i) + "번 학생의 영어 점수를 입력하세요> ");
				dto.setEng(Integer.parseInt(scanner.nextLine()));
				if((dto.getEng() < 0) || (dto.getEng() > 100)) {
					System.out.println("영어 점수의 입력 범위는 0 ~ 100까지 입니다!");
					continue;
				} else {
					break;
				}
			}
			
			while(true) {
				System.out.print((i) + "번 학생의 수학 점수를 입력하세요> ");
				dto.setMat(Integer.parseInt(scanner.nextLine()));
				if((dto.getMat() < 0) || (dto.getMat() > 100)) {
					System.out.println("수학 점수의 입력 범위는 0 ~ 100까지 입니다!");
					continue;
				} else {
					break;
				}
			}
			list.add(dto);	// dto를 한줄 완성하고 list에 넣어준다
		}
		System.out.println("입력을 완료하였습니다!");
		scanner.close();
	} // getScore()

	public void inputSave() {
		try {
			String outputPath = "D:\\Study_Java\\workspace\\17. IO\\SungjukInput.txt";
			FileWriter fw = new FileWriter(outputPath);
			BufferedWriter bw = new BufferedWriter(fw);
			
			bw.write("번호\t이름\t국어\t영어\t수학\n");
			bw.flush();
			
			int index = 0;
			for (FinalTestDTO dto : list) {
				if (index < list.size() -1) {
					String line = dto.getNum() + "\t" + dto.getName() + "\t" + dto.getKor() + "\t" + dto.getEng() + "\t" + dto.getMat() + "\n";
					index++;
					bw.write(line);
					bw.flush();
				} else {
					String line = dto.getNum() + "\t" + dto.getName() + "\t" + dto.getKor() + "\t" + dto.getEng() + "\t" + dto.getMat() + "\n";
					bw.write(line);
					bw.flush();
				} // if else
			} // for
			bw.close();
			fw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // try catch
	} // inputSave()

	public void readFile() {
		try {
			String inputPath = "D:\\Study_Java\\workspace\\17. IO\\SungjukInput.txt";
			FileReader fr = new FileReader(inputPath);
			BufferedReader br = new BufferedReader(fr);
			
			String line = null;
			FinalTestDTO dto = null;
			
			list.removeAll(list);	// 리무브를 안해주면 기존 데이터가 남아있어서 두 번 찍힘
			int cnt = 0;
			while((line = br.readLine()) != null) {
				if(cnt == 0) {		// 첫 줄 (번호 ~ 영어)을 무시 하기 위한 if문
					cnt++;
					continue;
				}				
				String[] sp = line.split("\t");
				dto = new FinalTestDTO(Integer.parseInt(sp[0]), sp[1], Integer.parseInt(sp[2]), Integer.parseInt(sp[3]), Integer.parseInt(sp[4]));
				list.add(dto);					
			} // while
			br.close();
			fr.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // try catch
	} // readFile()

	public void getSumAvg() {
		for (FinalTestDTO dto : list) {
			dto.setSum(dto.getKor() + dto.getEng() + dto.getMat());
			dto.setAvg(dto.getSum() / 3);
		} // foreach
	} // getSumAvg()
	
	public void AvgDescSort() {
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				FinalTestDTO temp = list.get(i);
				list.set(i, list.get(j));
				list.set(j, temp);
			} // for j
		} // for i
	} // AvgDescSort()

	public void outputSave() {
		try {
			String outputPath = "D:\\Study_Java\\workspace\\17. IO\\SungjukOutput.txt";
			fw = new FileWriter(outputPath);
			bw = new BufferedWriter(fw);
			df = new DecimalFormat("0.0");
			
			bw.write("번호\t이름\t국어\t영어\t수학\t총점\t평균\n");
			bw.flush();
			
			int index = 0;
			for (FinalTestDTO dto : list) {
				if (index < list.size() -1) {
					String line = dto.getNum() + "\t" + dto.getName() + "\t" + dto.getKor() + "\t" + dto.getEng() + "\t" + dto.getMat() + "\t" + dto.getSum() + "\t" + df.format(dto.getAvg()) + "\n";
					index++;
					bw.write(line);
					bw.flush();
				} else {
					String line = dto.getNum() + "\t" + dto.getName() + "\t" + dto.getKor() + "\t" + dto.getEng() + "\t" + dto.getMat() + "\t" + dto.getSum() + "\t" + df.format(dto.getAvg());
					bw.write(line);
					bw.flush();
				} // if else
			} // for
			bw.close();
			fw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // try catch
	} // outputSave()
} // class