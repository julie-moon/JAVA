package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Member;

public class MembersDAOImpl implements MembersDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	} // setSession() end

	@Override
	public List<Member> selectList() {
		return session.selectList("members.selectList");
	} // selectList() end
	
} // MembersDAOImpl end
