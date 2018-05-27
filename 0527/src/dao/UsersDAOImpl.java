package dao;

import org.apache.ibatis.session.SqlSession;

import vo.User;

public class UsersDAOImpl implements UsersDAO{

	private SqlSession session; 
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public User selectLoginUser(User user) {
		return session.selectOne("users.selectLoginUser", user);
	}
	
}
