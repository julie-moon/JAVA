package ex;
/*
 	자바의 숨겨진 비밀
 	개발자의 편리함을 위해서 생략하는 것들 
 	
 	1) java.lang.* (System, String 클래스 포함되어있음)
*/
import java.lang.*; // 생략 가능
import java.util.Scanner;

public class Ex2 {

	public static void main(String[] args) {
		
		// 유저가 콘솔에 입력하는 글자들을 얻어오는 Scanner 객체 얻기
		Scanner scanner = new Scanner(System.in);
		
		// 유저에게 메세지 출력
		System.out.println("정수 2개를 입력하세요.");
		
		// 첫 번째 정수 받기
		int num1 = scanner.nextInt();
		
		// 두 번째 정수 받기
		int num2 = scanner.nextInt();
		boolean biggerNum = true;
		
		// 출력
		System.out.println(num1 + " > " + num2 + " = " + (num1>num2));
		
	} // main() end
	
} // Ex2 class end
