package app;

import java.sql.Date;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Group;

public class Ex3 {

	public static void main(String[] args) {
		
		SqlSession session = SqlSessionUtil.getSession();
		
		// 그룹 객체 생성
		Group group = new Group();
		// 그룹명 세팅
		group.setName("NRG");
		// 데뷔일 Date객체 생성 후 
		Date debutDate = Date.valueOf("1997-10-28");
		// 데뷔일 세팅
		group.setDebutDate(debutDate);
		
		// insert 
		int result = session.insert("groups.insert", group);
		System.out.println(result + "개 그룹 생성 성공!");

	} // main() end

} // Ex3 class end
