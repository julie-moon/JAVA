package array;

public class Ex1 {

	public static void main(String[] args) {
		
		// int[] i = new int[5];
		int [] iArr = {1, 2, 3, 4};
		
		// for(초기값, 조건식, 증감식){}
		for(int i=0; i<iArr.length; i++) {
			System.out.println(iArr[i]);
		} // for end
		
		System.out.println("------------------------");
		
		/*
			자바 5버전 추가 : forEach(향상된 for문)
			for(자료형 : 배열이름(컬렉션)){반복 구문}
		*/
		for(int i:iArr) {
			System.out.println(i);
		} // for end
		
	} // main() end

} // Ex1 class end
