package app;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import util.SqlSessionUtil;

public class Ex1 {
										   // JVM한테 Exception 넘겨버림
	public static void main(String[] args) throws Exception{
		
		// SqlSession 'session'이 제일 중요함
		SqlSession session = SqlSessionUtil.getSession();
		
		/*
			SqlSession 객체의 주요 메소드
		 
			- insert : int(갯수)
			- delete : int(갯수)
			- update : int(갯수)
		 
			- selectList(여러 개) : List
			- selectOne(한 개) : VO
		 
			첫번째 인자는 namespace.id
		 */
		
		// delete()메소드 실행 후 리턴 값(몇 개의 행이 삭제 됐는지)을 result 변수로 받음
		int result = session.delete("groups.delete",15);
		System.out.println(result+"개 삭제 완료!");
		
	} // main() end
	
} // Ex1 class end
