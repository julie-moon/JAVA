package dao;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Member;

public class MembersDAO {
	
	public static Member selectLogin(Member member) {
		
		Member loginMember = null;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			loginMember = session.selectOne("members.selectLogin", member);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return loginMember;
		
	} // selectLogin() end
	
} // MembersDAO end
