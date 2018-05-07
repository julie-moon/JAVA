package app;

import java.sql.Date;
import java.util.Scanner;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Book;

public class Ex1 {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		
		System.out.println("입력할 도서의 이름 : ");
		String title = scanner.nextLine();
		System.out.println("저자명 : ");
		String name = scanner.nextLine();
		System.out.println("출판일 ex>2017-10-27");
		String pubdateStr = scanner.nextLine();
		
		Date pubdate = Date.valueOf(pubdateStr);
		// Book 객체 생성 후 유저에게 입력받은 데이터로 세팅
		Book book = new Book(title, name, pubdate);
		
		// 세션 얻기
		SqlSession session = SqlSessionUtil.getSession();
		
		// insert 수행 후 결과 갯수 얻기
		int result = session.insert("books.insertBook", book);
		System.out.println(result + "권의 책 등록 성공!");
		
	} // main() end

} // Ex1 class end