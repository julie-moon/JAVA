package array;

public class Ex2 {

	public static void main(String[] args) {
		
		String[] names = {"박지훈", 
						  "박우진", 
						  "강다니엘", 
						  "김재환", 
						  "라이관린",
						  "윤지성",
						  "하성운",
						  "옹성우",
						  "이대휘",
						  "배진영",
						  "황민현"};
		
		// 일반 for문
		for(int i = 0; i<names.length; i++) {
			System.out.println(names[i]);
		} // for end
		
		System.out.println("-----------------------");
		
		// for Each문(향상된 for문)
		for(String s:names) {
			System.out.println(s);
		} // for Each end
		
	} // main() end

} // Ex2 class end
