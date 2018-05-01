package ex;

import java.util.Scanner;

public class Ex1 {

	public static void main(String[] args) {
		/*
			객체자료형 Scanner 클래스형 지역변수 scanner 선언 후
			new라는 키워드를 사용하여 heap 메모리 영역에 공간을 하나 할당받고(레퍼런스) 
			Scanner()생성자를 호출하여 Scanner객체 생성한 뒤
			그 레퍼런스를 scanner변수에 대입
		*/  
		Scanner scanner = new Scanner(System.in);
		
		// 유저에게 메세지를 출력
		System.out.println("점수를 입력하세요");
		
				    // scanner.을 찍으면 접근할 수 있는 메소드 목록 
		int score = scanner.nextInt(); // 유저가 입력한 정수를 얻어오는 메소드
		
		if(score>=90) {
			System.out.println("합격");
		} else{
			System.out.println("불합격");
		} // if~else end
		
	} // main() end
	
} // Ex1 class end
