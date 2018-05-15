package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Book;
import vo.PageVO;

public class BooksDAO {
	
	public static List<Book> bookList(PageVO pageVO) {
		
		List<Book> list = null;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			list = session.selectList("books.bookList", pageVO);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return list;
		
	} // bookList() end
	
	public static int bookCount() {
		
		int count = 0;
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			count = session.selectOne("books.bookCount");
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			session.close();
			
		} // try ~ catch ~ finally end
		
		return count;
		
	} // bookCount() end
	
} // BooksDAO
