package util;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionUtil {

	public static SqlSession getSession() {
		
		SqlSession session = null;
		
		try {
			
			// mybatis-config.xml을 읽어오는 객체
			Reader reader = Resources.getResourceAsReader("config/mybatis-config.xml"); 
			
			// SqlSessionFactoryBuilder
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			
			// SqlSessionFactory
			SqlSessionFactory factory = builder.build(reader);
			
			session = factory.openSession(true);
		
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} // try~catch end
		
		return session;
		
	} // getSession() end
	
} // SqlSessionUtil class end
