package app;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Idol;

public class Ex6 {

	public static void main(String[] args) {
		
		Idol idol = new Idol();
		idol.setNo(8);
		idol.setWeight(80.5);
		
		SqlSession session = SqlSessionUtil.getSession();
		/*
			첫 번째 인자는 namespace.id
			두 번째 인자는 우리가 myBatis 한테 넘겨줄 값
		*/
		int result = session.update("idols.update",idol);
		System.out.println(result + "명의 아이돌 정보 수정 성공!");

	} // main() end

} // Ex6 class end
