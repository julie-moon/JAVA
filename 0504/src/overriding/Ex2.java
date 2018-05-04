package overriding;

class B {
	void test() {
		System.out.println("BBB");
	} // test() end
} // B class end

public class Ex2 extends B {
	void test() {
		System.out.println("ExExEx");
	} // test() end
	public static void main(String[] args) {
		B b = new Ex2();
		/*
		 	메소드 재 정의(오버라이딩)
		 	상속 관계에서 부모와 자식이 똑같은 메소드를 가지고 있음
		 	부모에서 호출해도 (최하위)자식의 메소드가 호출되는 것
		*/
		b.test(); // 실행 결과 ExExEx나옴(오버라이딩 됨)
	}
} // Ex2 class end
