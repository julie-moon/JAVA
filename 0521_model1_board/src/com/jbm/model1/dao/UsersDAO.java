package com.jbm.model1.dao;

import org.apache.ibatis.session.SqlSession;

import com.jbm.model1.util.SqlSessionUtil;
import com.jbm.model1.vo.User;

public class UsersDAO {
	
	public static User loginUser(User user) {
		
		User loginUser = null;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			loginUser = session.selectOne("users.loginUser", user);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return loginUser;
		
	} // loginUser() end
	
	public static int checkId(String id) {
		
		int count = 0;
		SqlSession session = null; 
		
		try {
			
			session = SqlSessionUtil.getSession();
			count = session.selectOne("users.checkId", id);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return count;
		
	} // checkId() end
	
	public static int checkNickname(String nickname) {
		
		int count = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			count = session.selectOne("users.checkNickname", nickname);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return count;
		
	} // checkNickname() end
	
	public static int insertUser(User user) {
		
		int result = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			result = session.insert("users.insertUser", user);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
		
	} // insertUser() end
	
} // UsersDAO end
