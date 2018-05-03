package wrapper;

public class Ex2 {

	public static void main(String[] args) {
		
		/*
			자바 5 버전에서 추가된 개념으로 Wrapper 클래스들에서 적용
			 
			오토박싱(암시적 객체 생성) : 기본자료형 -> 객체자료형 
			언박싱 : 객체자료형 -> 기본자료형
		 */
		
		// 오토박싱 : 기본자료형 -> 객체자료형
		Integer i = 4;
		
		// 언박싱 : 객체자료형 -> 기본자료형
		int j = i;
		
	} // main() end

} // Ex2 class end
