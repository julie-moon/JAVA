package app;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Group;

public class Ex7 {

	public static void main(String[] args) {
		
		SqlSession session = SqlSessionUtil.getSession();
		
		List<Group> list = session.selectList("groups.selectList");
		
		for(Group group : list) {
			System.out.println(group.getName());
		} // for end
			
	} // main() end

} // Ex7 class end
