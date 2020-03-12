public class Ex01_Array01 {
	public static void main(String[] args) {
		// 정수를 저장할 배열(arr)을 선언하고
		// 저장할 배열의 길이를 3으로 생성하고
		// 모든 요소에 10을 할당하고 출력하시오.
		
		int[] arr;				// 정수형 배열 arr을 선언 : int arr[];
		arr = new int[3];		// 배열의 생성
//		int[] arr = new int[3];	// 배열의 선언 및 생성
		
		arr[0] = 10;	// 배열(arr)의 0번지(index)에 10을 할당
		arr[1] = 10;	// 배열(arr)의 1번지(index)에 10을 할당
		arr[2] = 10;	// 배열(arr)의 2번지(index)에 10을 할당
		
		System.out.println("arr[0]의 값 : " + arr[0]); // 배열(arr)의 0번지(index) 값을 출력
		System.out.println("arr[1]의 값 : " + arr[1]); // 배열(arr)의 1번지(index) 값을 출력
		System.out.println("arr[2]의 값 : " + arr[2]); // 배열(arr)의 2번지(index) 값을 출력
		
		System.out.println(arr);	// 배열(arr)이 참조하는 메모리의 해쉬코드 값을 출력(16진법)
	} // main()
} // class

/*
 * 명령어 구성
  Opcode	R		Operand
   	명령부	레지스터	번지
  
 * Stack : FILO (First In Last Out)
  			Memory
  Pop	→	C		→ Push
  			B
  			A
 Memory
 번지	데이터
 1	xx
 2	xx
 3	10
 :	:
 10	100
 
 */