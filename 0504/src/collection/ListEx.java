package collection;

import java.util.ArrayList;
import java.util.List;

public class ListEx {

	public static void main(String[] args) {
		
		/*
			자바스크립트의 배열은 무한으로 늘어나는데 비해
			자바의 배열은 크기가 고정되어 있기 때문에 확대 / 축소가 불가능함
			
			String[] names = new String[5];
			names[0] = "박지훈";
			names[1] = "윤지성";
			names[2] = "황민현";
			names[3] = "박우진";
			names[4] = "라이관린";
			names[5] = "배진영"; // 에러남
			
			그래서 사이즈가 0이었다가 우리가 객체를 넣는 만큼 늘어나고,
			빼내는 만큼 줄어드는 객체가 필요함. 이런 객체들을 Collection이라고 함.
			1) Set
			2) Map
			3) List : 무한 배열(index 있음)
		*/
		
		// List는 interface(생성자 없음)이기 때문에 객체 생성 불가능함
		List list = new ArrayList();
		list.add("박지훈");
		list.add("박지훈");
		list.add("윤지성");
		list.add("박우진");
		list.add(4); // 오토박싱
		System.out.println("갯수 : " + list.size());
		
		// 일반 for문
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		};
		
		System.out.println("-------------------------");
		
		// 향상된 for문
		for(Object obj:list) { // .add(Object o)이기 때문에 자료형은 Object
			System.out.println(obj);
		}
		
	} // main() end
	
} // ListEx class end
