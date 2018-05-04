package animal;

/*
	추상클래스 : abstract로 선언된 클래스
	new 생성자()로 객체 생성 불가능
*/
public abstract class Animal {

	public String name;
	public int age;
	
	/*
		Animal의 cry() 메소드는 overriding 되어있기 때문에 본체({}(body))가 필요 없음
		Animal객체.cry()가 가능하게 하기 위해서 내용은 없고 정의만 필요함
		(접근제한자 리턴자료형 이름 인자 등)
		
		이때, 추상 메소드로 선언함
	*/
	public abstract void cry();
	
	// public void test() {} // 일반메소드({}(body)가 있음)
} // Animal class end
