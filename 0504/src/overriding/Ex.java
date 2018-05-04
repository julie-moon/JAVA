package overriding;

class A{
	int a = 5;
}

public class Ex extends A {

	/*
		overriding(다른 무엇보다 더 중요한, 최우선시 되는)은 
		메소드 재 정의(상속 관계)
	*/
	
	int a = 7;
	
	public static void main(String[] args) {
	
		Ex e = new Ex();
		
		System.out.println(e.a);
		
		A a = e;
		
		System.out.println(a.a);
		
		Object o = e;
		
		/*
			toString() : 객체를 String으로 변경하는 메소드
		 	객체를 출력하면 객체.toString()을 호출하여 그 String을 출력
		*/
		
		System.out.println(o);
		System.out.println(o.toString());
		
		// e = (Ex)o;
		
		String s = "Test";
		/*
			오버라이딩 : 부모에 있는 메소드를 자식에 재정의 하는 것 
		*/
		System.out.println(s.toString());
		
	} // main() end
	
} // Ex class end
