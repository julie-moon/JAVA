package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Group;
import vo.PageVO;

public class GroupsDAO {

	public static List<Group> groupList(PageVO pageVO) {
		
		List<Group> list = null;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			list = session.selectList("groups.groupList", pageVO);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return list;
		
	} // groupList() end
	
	public static int groupCount() {
		
		int count = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			count = session.selectOne("groups.groupCount");
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return count;
		
	} // groupCount() end
	
}
