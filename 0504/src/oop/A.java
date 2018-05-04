package oop;

public interface A {

	/*
		인터페이스는 클래스가 아니다.(생성자 없음)
		상수와 추상메소드만 가짐
	*/
	
	// 상수(변하지 않는 수이기 때문에 초기화 꼭 해줘야함!)
	static final int NUM = 0;
	// static final 생략 가능(인터페이스는 상수만 가질 수 있기 때문에)
	int A = 10; // (static) (final) int A = 10;
	
	public abstract void test();
	
	// abstract 생략 가능(인터페이스는 추상메소드만 가질 수 있어서)
	public void test2();
	
} // A interface end
