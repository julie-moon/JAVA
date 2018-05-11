package com.jbm.mms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jbm.mms.util.SqlSessionUtil;
import com.jbm.mms.vo.Movie;

public class MoviesDAO {
	
	public static List<Movie> movieList(String name, String type) {
		
		List<Movie> list = null;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			
			if(name.equals(" ")) {
				
				if(type.equals("audienceNum")) {
					list = session.selectList("movies.selectListOrderByAud");
				} else if(type.equals("releaseDate")) {
					list = session.selectList("movies.selectListOrderByDate");
				} // if ~ else if end
				
			} else if(name != null) {
				
				if(type.equals("audienceNum")) {
					list = session.selectList("movies.searchListOrderByAud", name);
				} else if(type.equals("releaseDate")) {
					list = session.selectList("movies.searchListOrderByDate", name);
				} // if ~ else if end
				
			} // if ~ else if end
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return list;
		
	} // movieList() end
	
	/*
		public static List<Movie> movieList(String type) {
		
			List<Movie> list = null;
			SqlSession session = null;
			
			try {
				
				session = SqlSessionUtil.getSession();
				
				if(type.equals("audienceNum")) {
					list = session.selectList("movies.selectListOrderByAud");
				} else if(type.equals("releaseDate")) {
					list = session.selectList("movies.selectListOrderByDate");
				} // if ~ else if end
				
			} catch(Exception e) {
				
				e.printStackTrace();
				
			} finally {
				
				session.close();
				
			} // try ~ catch ~ finally end
			
			return list;
		
		} // movieList() end
	*/
	
	public static int insertMovie(Movie movie) {
		
		int result = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			result = session.insert("movies.insertMovie", movie);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
		
	} // insertMovie() end
	
	public static Movie selectOne(int no) {
		
		Movie movie = null;
		SqlSession session = SqlSessionUtil.getSession();
		
		try {
		
			session = SqlSessionUtil.getSession();
			movie = session.selectOne("movies.selectOne", no);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return movie;
		
	} // selectOne() end
	
	public static int updateMovie(Movie movie) {
		
		int result = 0;
		SqlSession session = SqlSessionUtil.getSession();
		
		try {
		
			session = SqlSessionUtil.getSession();
			result = session.update("movies.updateMovie", movie);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
		
	} // updateMovie() end
	
	public static int deleteMovie(int no) {
		
		int result = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			result = session.delete("movies.deleteMovie", no);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
		
	} // deleteMovie() end
	
	public static int genreCount(int genre) {
		
		int result = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			result = session.selectOne("movies.genreCount", genre);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return result;
		
	} // genreCount() end
	
} // MoviesDAO class end
