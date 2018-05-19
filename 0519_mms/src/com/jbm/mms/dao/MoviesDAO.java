package com.jbm.mms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jbm.mms.util.SqlSessionUtil;
import com.jbm.mms.vo.Movie;

public class MoviesDAO {
	
	public static int countMovieNum(int genre) {
		
		int count = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			count = session.selectOne("movies.countMovieNum", genre);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return count;
		
	} // countMovieNum() end
	
	public static List<Movie> movieList() {
		
		List<Movie> list = null;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			list = session.selectList("movies.movieList");
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return list;
		
	} // movieList() end
	
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
	
	public static List<Movie> movieList(String query) {
		
		List<Movie> list = null;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			list = session.selectList("movies.movieListByName", "%"+query+"%");
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return list;
		
	} // movieList() end
	
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
	
} // MoviesDAO class end
