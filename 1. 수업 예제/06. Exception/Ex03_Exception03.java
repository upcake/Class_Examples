import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Ex03_Exception03 {
	public static void main(String[] args) {
		try {
			int result = 10 / 2;		// ArithmeticException : 미확인 예외
			System.out.println(result);
		
			int[] arr = new int[3];		// ArrayIndexOutOf
			arr[0] = 10;
			System.out.println(arr[0]);
			
			String str = "100a";
			int pstr = Integer.parseInt(str);	// NumberFormatException : 미확인 에러
			System.out.println(pstr);
			
			FileInputStream fis = new FileInputStream("abc.txt"); // FileNotFoundException : 확인 예외 
			} catch (ArithmeticException e) {
				System.out.println("입력 값이 잘못 되었습니다.");
			} catch (ArrayIndexOutOfBoundsException e) {
				System.out.println("배열의 index가 잘못 되었습니다.");
			} catch (FileNotFoundException e) {
				System.out.println("해당 파일이 존재하지 않습니다.");
			} catch (Exception e) {		// 모든 예외 클래스의 상위 클래스
				e.printStackTrace();	// 예외 발생한 시점을 메모리에서 추적하여 상세하게 출력
		} // try catch
	} // main()
} // class