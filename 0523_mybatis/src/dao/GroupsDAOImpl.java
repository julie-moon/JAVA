package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Group;

public class GroupsDAOImpl implements GroupsDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<Group> selectList() {
		
		return session.selectList("groups.selectList");
		
	} // selectList() end
	
} // GroupsDAOImpl end
