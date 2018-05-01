package ex;

public class Hello {

	// 한 줄 주석
	/*
	 	여러 줄 주석
	*/
	// 멤버 필드(클래스에 선언)는 초기화 할 필요 없음 
	public static void main(String[] args) {
		// java가 실행되면, static 먼저 
		// 웹은 main이 없음
		/*
			기본 자료형
			1. boolean  
			2. char 
			3. byte 
			4. short 
			5. int 
			6. long 
			7. float 
			8. double
		*/
		
		// 기본자료형 boolean형 지역변수(메소드 안에 선언) a를 선언 // 지역변수는 초기화 무조건 해야함
		boolean a;
		
		// boolean형 지역변수 a에 true값을 대입 
		a = true;
		
		System.out.println(a);
		
		// 기본자료형 byte형 지역변수 b를 선언하고,정수 5 대입
		byte b = 5;
		
		// 기본자료형 byte형 지역변수 c를 선언하고, 정수 7 대입
		byte c = 7;
		
		/*
			자바의 기본 정수 : int형
			int형 혹은 int형보다 작은 자료형들은 연산을 하면 int형이 됨
			따라서 b = b + c;는 오류 뜸
		*/
		int i = b + c;
		
		/*
		 	int보다 크다면 큰 자료형으로 자동 형변환 됨
		*/		
		long l = 1;
		// i = i + l; 오류남
		l = i + l;
		
		/*
			char형은 내부적으로 정수 처리
			2byte인데 0 ~ 65535까지의 수
			
			유니코드와 연관이 있음
			
			우리가 키보드에서 A를 치면 컴퓨터는 'A'로 처리하는게 아니라, 각 글자마다 숫자가 있음
			ex > A = 65
				 0 = 48
		*/
		char e = 1;
		
	} // main() end
	
} // Hello class end
