package org.jbm.guestbook.dao;

import java.util.List;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.jbm.guestbook.util.SqlSessionUtil;
import org.jbm.guestbook.vo.Guest;

public class GuestbookDAO {
	
	public static List<Guest> selectList() {
		
		List<Guest> list = null;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			list = session.selectList("guestbook.selectList");
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return list;
		
	} // selectList() end
	
	public static int insert(Guest guest) {
		
		int result = 0;
		SqlSession session = null;
		
		try{
			 
			session = SqlSessionUtil.getSession();
			result = session.insert("guestbook.insert", guest);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
		
	} // insert() end
	
	public static int delete(int no) {
		
		int result = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			result = session.delete("guestbook.delete", no);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
	} // delete() end
	
	public static Guest selectOne(int no) {
		
		Guest guest = null;
		SqlSession session = null;
		
		try {
		
			session = SqlSessionUtil.getSession();
			guest = session.selectOne("guestbook.selectOne", no);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return guest;
		
	} // selectOne() end
	
	public static int update(Guest guest) {
		
		int result = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			result = session.update("guestbook.update", guest);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result; 
		
	} // update() end
	
} // GuestbookDAO class end
