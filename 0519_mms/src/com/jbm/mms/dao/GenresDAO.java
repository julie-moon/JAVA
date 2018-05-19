package com.jbm.mms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jbm.mms.util.SqlSessionUtil;
import com.jbm.mms.vo.Genre;

public class GenresDAO {

	public static int insert(String name) {
		
		int result = 0;
		SqlSession session = null;
		
		try{
			 
			session = SqlSessionUtil.getSession();
			result = session.insert("genres.insert", name);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally{
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
		
	} // insert() end
	
	public static List<Genre> genreList(){
		
		List<Genre> list = null;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			list = session.selectList("genres.genreList");
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return list;
		
	} // genreList() end
	
	public static int deleteGenre(int no) {
		
		int result = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			result = session.delete("genres.deleteGenre", no);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
		
	} // deleteGenre() end
	
} // GenresDAO
