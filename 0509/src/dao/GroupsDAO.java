package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Group;

public class GroupsDAO {
	
	// 그룹 목록을 불러오는 메소드 
	public static List<Group> groupList() {
		
		/*
		 	List<Group> list = sqlSession.selectList("groups.groupList");
		*/
		
		// 리턴자료형과 같은 지역변수 선언 후 초기화
		List<Group> list = null;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			list = session.selectList("groups.groupList");
			
		} catch(Exception e) {
		
			e.printStackTrace();
		
		} finally {
			
			// 커넥션 풀 반환
			session.close();
			
		} // try ~ catch ~ finally end
		
		return list;
		
	} // groupList() end
	
	public static int deleteGroup(int no) {
		
		int result = 0;
		SqlSession session = null;
		
		try{
			
			session = SqlSessionUtil.getSession();
			result = session.delete("groups.deleteGroup", no);
			 
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
		
	} // deleteGroup() end
	
	public static int insertGroup(Group group) {
		
		int result = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			result = session.insert("groups.insertGroup", group);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
		
	} // insertGroup() end
	
	public static Group selectOne(int no) {
		
		// 리턴 자료형과 동일한 변수명 선언
		Group group = null;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			group = session.selectOne("groups.selectOne", no);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return group;
		
	} // selectOne() end
	
	public static int updateGroup(Group group) {
		
		int result = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			result = session.update("groups.updateGroup", group);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
		
	} // updateGroup() end
	
}
