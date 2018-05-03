package wrapper;

import java.util.Scanner;

public class Ex1 {

	public static void main(String[] args) {
		
		int a = 4;
		
		// 같은 패키지 내에서 있는 클래스가 아니면 import해서 써야 함
		Scanner scan;
		/*
			자바의 숨겨진 비밀 : java.lang.* 생략 가능
						 (java.lang 패키지 안에 Integer 클래스가 있음)
		*/
		
		/*
			Wrapper 클래스들 : Integer, Boolean... 
						        기본자료형을 객체자료형처럼 사용하기 위해 
		*/
		Integer i = new Integer(4);
		
		int max = Integer.MAX_VALUE;
		System.out.println(max);
		
		// String을 int형으로 변경
		int num = Integer.parseInt("4354");
		System.out.println(num);
		
	} // main() end
	
} // Ex1 class end
