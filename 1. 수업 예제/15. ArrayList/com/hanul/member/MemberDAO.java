package com.hanul.member;

import java.util.ArrayList;

public class MemberDAO {
	// 출력 메서드
	public void display(ArrayList<MemberDTO> list) {
		for (int i = 0; i < list.size(); i++) {
			System.out.print(list.get(i).getName() + "\t");
			System.out.print(list.get(i).getAge() + "\t");
			System.out.print(list.get(i).getAddr() + "\t");
			System.out.print(list.get(i).getTel() + "\n");
		}
		System.out.println("=============================================");
	} // display()

	//	이름을 비교할 때는 list.get(i).getName().compareTo(list.get(j).getName()) > 0 으로 한다
	public void ageAscSort(ArrayList<MemberDTO> list) {
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if(list.get(i).getAge() > list.get(j).getAge()) {
					MemberDTO temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				} // if
			} // for j
		} // for i
		System.out.println("=============================================");
	} // ageAscSort()

	public void nameDescSort(ArrayList<MemberDTO> list) {
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < list.size(); j++) {
				if(list.get(i).getName().compareTo(list.get(j).getName()) < 0) {
					MemberDTO temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				}
			}
		}
		System.out.println("=============================================");
	} // nameDescSort()		
} // class