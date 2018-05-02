package ex;

public class Ex1 {
	
    // int a
	static int a;
	
	int b;
	
	void test() {
		/*
			같은 클래스 내부에서 인스턴스 멤버들끼리 접근 시 this. 생략 가능
			(this.)b = 10;
		*/
		b = 10;
	}
	
	public static void main(String[] args) {
		/*
			Ex1에 선언된 접근제한자 default 기본자료형 int형 인스턴스 멤버필드 b에 값을 대입하고 싶으면
			Ex1 클래스의 생성자를 호출하여 객체를 생성하고,
			객체명.멤버명(멤버필드 / 멤버메소드)로 접근해야함
			
			Ex1 ex1 = new Ex1();
			ex1.b = 10;
			
			Ex1에 선언된 접근제한자 default 기본자료형 int형 static 멤버필드 a에 값을 대입하고 싶으면
			클래스명.멤버명(멤버필드 / 멤버메소드)로 접근해야함
			하지만, 같은 클래스 내부에서 static 멤버에 접근할 때는 클래스명. 생략 가능함
			(Ex1.)a = 10;
		*/
		
		a = 10;
		
		/*Ex1에 선언된 인스턴스 멤버필드 b에 접근하기 위해서는 객체가 필요한데, 객체가 만들어지지 않아서 오류뜸
			b = 100;
		*/ 
	} // main() end
	
} // Ex1 class end
