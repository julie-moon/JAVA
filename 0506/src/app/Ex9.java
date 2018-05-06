package app;

import java.util.List;
import java.util.Scanner;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Idol;

public class Ex9 {

	public static void main(String[] args) {
	
		System.out.println("검색할 아이돌 번호를 입력하세요.");
		
		Scanner scanner = new Scanner(System.in);
		
		int no = scanner.nextInt();

		SqlSession session = SqlSessionUtil.getSession();
		Idol idol = (Idol)session.selectOne("idols.selectOne", no);
		
		System.out.print("번호 : " + idol.getNo());
		System.out.print(" / 이름 : " + idol.getName());
		System.out.print(" / 키 : " + idol.getHeight());
		System.out.print(" / 몸무게 : " + idol.getWeight());
		System.out.print(" / 생년월일 : " + idol.getBirthDate());
		System.out.print(" / 그룹 번호 : " + idol.getGroupNo());
		
	} // main() end	

} // Ex9 class end
