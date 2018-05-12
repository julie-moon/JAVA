package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Group;

public class GroupsDAO {
	
	public static List<Group> selectList(String name) {
		
		List<Group> list = null;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			list = session.selectList("groups.selectList", "%"+name+"%");
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return list; 
		
	} // selectList() end
	
} // GroupsDAO end
