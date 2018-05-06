package app;

import java.sql.Date;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Idol;

public class Ex4 {

	public static void main(String[] args) {
		
		SqlSession session = SqlSessionUtil.getSession();
		
		/*
		Idol idol = new Idol();
		idol.setName("이성진");
		idol.setHeight(171.4);
		idol.setWeight(66);
		Date birthDate = Date.valueOf("1977-02-05");
		idol.setBirthDate(birthDate);
		idol.setGroupNo(16);
		*/
		
		Date birthDate = Date.valueOf("1977-02-05");
		Idol idol = new Idol("송민호", 182, 75, birthDate, 9);
		
		int result = session.insert("idols.insert", idol);
		System.out.println(result + "명의 아이돌 생성 성공!");
		
	} // main() end

} // Ex4 class end
