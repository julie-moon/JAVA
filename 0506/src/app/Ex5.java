package app;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Group;

public class Ex5 {

	public static void main(String[] args) {
		
		// 12번 그룹의 이름을 '빅뱅'으로 변경
		Group group = new Group();
		group.setNo(12);
		group.setName("빅뱅");
		
		SqlSession session = SqlSessionUtil.getSession();
		
		int result = session.update("groups.update", group);
		System.out.println(result + "개의 그룹 수정 성공!");
		
	} // main() end

} // Ex5 class end
