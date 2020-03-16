import java.util.Scanner;

public class Ex03_Method03 {
	// ÀÓÀÇÀÇ ½Ç¼ö 2°³¸¦ ÀÔ·Â¹Ş¾Æ(num1, num2) ¢º Scanner
	// µÎ ½Ç¼öÀÇ ÇÕÀ» ±¸ÇÏ¿© ¸®ÅÏÇÏ´Â ¸Ş¼Òµå(getSum)¸¦ È£­„
	// °á°ú¸¦ Ãâ·Â
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Ã¹ ¹øÂ° ½Ç¼ö¸¦ ÀÔ·ÂÇÏ¼¼¿ä : ");
		double num1 = Double.parseDouble(scanner.nextLine());
		System.out.print("µÎ ¹øÂ° ½Ç¼ö¸¦ ÀÔ·ÂÇÏ¼¼¿ä : ");
		double num2 = Double.parseDouble(scanner.nextLine());
		scanner.close();
		
		double sum = getSum(num1, num2);
		System.out.println("Ã¹ ¹øÂ° ½Ç¼ö : " + num1);
		System.out.println("µÎ ¹øÂ° ½Ç¼ö : " + num2);
		System.out.println("µÎ ½Ç¼öÀÇ ÇÕ : " + sum);
		System.out.println("µÎ ½Ç¼öÀÇ ÇÕ : " + getSum(num1, num2));
	} // main()
	
	// ÀÓÀÇÀÇ ½Ç¼ö 2°³¸¦ Àü´Ş ¹Ş¾Æ, µÎ ½Ç¼öÀÇ ÇÕ(sum)À» ±¸ÇÏ¿© ¸®ÅÏÇÏ´Â ¸Ş¼Òµå(getSum())¸¦ Á¤ÀÇ
	public static double getSum(double num1, double num2) {
//		double sum = num1 + num2;
//		return sum;
		return num1 + num2;
	} // getSum()
} // class
