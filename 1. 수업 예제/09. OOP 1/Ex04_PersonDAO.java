public class Ex04_PersonDAO {
	// 출력 메소드
	public void display(Ex04_PersonDTO[] person) {
		System.out.println("이름\t나이\t키\t체중\t성별");
		System.out.println("===================================");
		for (int i = 0; i < person.length; i++) {
			System.out.print(person[i].getName() + "\t");
			System.out.print(person[i].getAge() + "\t");
			System.out.print(person[i].getHeight() + "\t");
			System.out.print(person[i].getWeight() + "\t");
			System.out.print(person[i].getGender() + "\n");
			System.out.println("===================================");
		} // for
	} // display()

	// 나이의 오름차순 정렬
	public void ageAscSort(Ex04_PersonDTO[] person) {
		for (int i = 0; i < person.length; i++) {
			for (int j = i + 1; j < person.length; j++) {
				if(person[i].getAge() > person[j].getAge()) {	// 오름차순
					Ex04_PersonDTO temp = person[i];
					person[i] = person[j];
					person[j] = temp;
				} // if
			} // for j
		} // for i
	} // ageAscSort

	// 나이의 내림차순 정렬
	public void heightDescSort(Ex04_PersonDTO[] person) {
		for (int i = 0; i < person.length; i++) {
			for (int j = i + 1; j < person.length; j++) {
				if(person[i].getHeight() < person[j].getHeight()) {	// 내림차순
					Ex04_PersonDTO temp = person[i];
					person[i] = person[j];
					person[j] = temp;
				} // if
			} // for j
		} // for i
	} // heightDescSort
} // class
