package ex;

import java.util.Scanner;

public class Ex3 {

	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("단을 입력하세요.");
		
		int num = scanner.nextInt();
		
		for(int i = 1; i<10 ; i++) {
			System.out.println(num + " * " + i + " = " + (num*i));
		} // for end
		
	} // main() end
	
} // Ex3 class end
