package app;

import java.util.Scanner;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;

public class Ex2 {

	public static void main(String[] args) {
		
		// 지울 번호 입력 받기
		Scanner scanner = new Scanner(System.in);
		System.out.println("지울 번호를 입력하세요");
		
		int no = scanner.nextInt();
		
		SqlSession session = SqlSessionUtil.getSession();
		int result = session.delete("books.delete", no);
		System.out.println(result+"개의 도서 삭제 완료!");
		
	} // main() end

} // Ex2 class end
