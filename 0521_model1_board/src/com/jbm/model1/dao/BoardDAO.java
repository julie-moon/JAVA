package com.jbm.model1.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jbm.model1.util.SqlSessionUtil;
import com.jbm.model1.vo.Board;
import com.jbm.model1.vo.PageVO;

public class BoardDAO {

	public static int insertContent(Board board) {
		
		int result = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			result = session.insert("board.insertContent", board);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
		
	} // insertContent() end
	
	public static List<Board> boardList(PageVO pageVO) {
		
		List<Board> list = null;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			list = session.selectList("board.boardList", pageVO);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return list;
		
	} // boardList() end
	
	public static int boardCount() {
		
		int count = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			count = session.selectOne("board.boardCount");
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return count;
		
	} // boardCount() end
	
	public static Board selectContent(int no) {
		
		Board content = null;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			content = session.selectOne("board.selectContent", no);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return content;
		
	} // selectContent() end
	
	public static int updateHit(int no) {
		
		int result = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			result = session.update("board.updateHit", no);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
		
	} // updateHit()
	
	public static int deleteContent(int no) {
		
		int result = 0;
		SqlSession session = null;
		
		try{
			 
			session = SqlSessionUtil.getSession();
			result = session.delete("board.deleteContent", no);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
		
	} // deleteContent() end
	
public static int updateContent(Board board) {
		
		int result = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			result = session.insert("board.updateContent", board);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
		
	} // updateContent() end
	
} // BoardDAO end
