package string;

public class A {
	
	// 기본 생성자
	public A() {
		
	}
	
	// 인자가 1개인 생성자
	private A(int a) {
		
	}
	
	public static void main(String[] args) {
	
		A a = new A();
		A b = new A();
		
		// 객체의 항등비교는 레퍼런스 비교이기 때문에 false
		System.out.println(a == b);
		System.out.println(a.equals(b));
		
		String s = new String("A");
		String s2 = new String("A");
		
		// 객체의 항등비교는 레퍼런스 비교이기 때문에 false
		System.out.println(s==s2);
		/*
			일반적인 객체는 equals()도 '==' 즉, 레퍼런스 비교
			그러나 String은 레퍼런스보다는 값이 중요하기 때문에 
			equals()메소드가 재정의(오버라이딩)되어서 '값' 비교
		*/
		System.out.println(s.equals(s2));
		
	} // main() end
	
} // A class end
