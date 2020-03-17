import java.util.Scanner;

public class Ex06BinSearch {
	// 이진 검색(Binary Search) : low, middle, high 값을 사용
	// low : arr[0] 부터 시작하여 arr[middle + 1] 변경
	// high : arr[arr.length - 1] 부터 시작하여 arr[middle - 1] 변경
	// middle : (low + high) / 2
	// 찾고자 하는 데이터를 중앙에 위치한 중간 값과 비교하는 방법
	// 데이터 목록은 반드시 사전에 오름차순으로 정렬되어 있어야 한다(전제조건)
	public static void main(String[] args) {
		int[] arr = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
		Scanner scanner = new Scanner(System.in);
		System.out.print("찾는 수를 입력하세요 : ");
		int searchData = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		binSearch(arr, searchData);

		int index = binSearch(arr, searchData);	// seqSearch() 메소드 호출
		if(index == -1) {
			System.out.println("찾는 수는 " + searchData + "이며, 검색에 실패했습니다");
		} else {
			System.out.println("찾는 수는 " + searchData + "이며, " + index + "번째에 있습니다.");
		} // if
	} // main()
	
	public static int binSearch(int[] arr, int searchData) {
		int index = -1;
		int low = 0, high = arr.length - 1, middle = 0;
		while(low <= high) {
			middle = (low + high) / 2;		// 중간값이 저장된 배열의 index
			if(arr[middle] == searchData) {	// 성공 : 검색 완료
				index = middle + 1;
				break;
			} else if(arr[middle] < searchData) {
				low = middle + 1;			// low 포인터 변경 : 중간값을 기준으로 왼쪽 부분을 제외
			} else if(arr[middle] > searchData) {
				high = middle - 1;			// high 포인터 변경 : 중간값을 기준으로 오른쪽 부분을 제외
			} // if else if
		} // while
		return index;
	} // binSearch()
} // class

/*
int[] arr = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
searchData : 70

low : 0 → arr[0]
high : arr.length - 1 → arr[9]
middle : (low + high) / 2 → arr[4] ▶ 50

arr[middle] < searchData (50 < 70)
low : arr[middle + 1] → arr[5]
middle : (low + high) / 2 → arr[7] ▶ 80

arr[middle] < searchData (80 > 70)
low : arr[middle - 1] → arr[6]
middle : (low + high) / 2 → arr[5] ▶ 60

arr[middle] < searchData (60 < 70)
low : arr[middle + 1] → arr[6]
middle : (low + high) / 2 → arr[6] ▶ 70

arr[middle] == searchData (70 == 70)
index = middle
*/