package ex;

import vo.Idol;

public class IdolApp {

	public static void main(String[] args) {
		/*
			오버로딩 : 이름은 같은데(메소드 / 생성자 ) 인자가 다름
			
			인자가 다르다는 것은
			1) 인자의 갯수가 다름
			2) 인자의 자료형이 다름
			3) 인자의 순서가 다름 
		*/
		Idol idol = new Idol();
		
		idol.setName("박지훈");
		idol.setHeight(172);
		idol.setWeight(60);
		idol.setGroupName("워너원");
		
		String name = idol.getName();
		double height = idol.getHeight();
		double weight = idol.getWeight();
		String groupName = idol.getGroupName();
		
		System.out.println("이름 : " + name);
		System.out.println("키 : " + height);
		System.out.println("몸무게 : " + weight);
		System.out.println("그룹명 : " + groupName);
		
		Idol idol2 = new Idol("박우진", 176, 60, "워너원");
		System.out.println(idol2.getName());
		
	} // main() end
	
} // IdolApp class end
