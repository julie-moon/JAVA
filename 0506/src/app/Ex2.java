package app;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import util.SqlSessionUtil;

public class Ex2 {

	public static void main(String[] args) throws Exception{
			
		SqlSession session = SqlSessionUtil.getSession();
		
		int result = session.delete("idols.delete",17);
		System.out.println(result+"명 삭제 완료!");

	} // main() end

} // Ex2 class end
