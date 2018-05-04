package collection;

import java.util.ArrayList;
import java.util.List;

public class ListEx2 {

	public static void main(String[] args) {
		
		/* 
			제네릭 : 자료형을 고정
		*/
		List<String> names = new ArrayList();
		
		names.add("박지훈");
		names.add("박우진");
		names.add("윤지성");
		names.add("배진영");
		names.add("라이관린");
		
		// 일반 for문
		for(int i=0; i<names.size(); i++) {
			System.out.println(names.get(i));
		} // for end
		
		System.out.println("=-------------------");
		
		// 향상된 for문
		for(String name : names) {
			System.out.println(name);
		} // for
		
	} // main() end
	
} // ListEx2 class end
