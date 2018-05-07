package app;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Book;

public class Ex3 {

	public static void main(String[] args) {
		
		SqlSession session = SqlSessionUtil.getSession();
		
		List<Book> list = session.selectList("books.selectList");
		
		for(Book book : list) {
			System.out.print("번호 : " + book.getNo());
			System.out.print(" / 도서명 : " + book.getTitle());
			System.out.print(" / 저자명 : " + book.getAuthor());
			System.out.println(" / 출판일 : " + book.getPubdate());
		} // for() end
		
	} // main() end

} // Ex3 class end
