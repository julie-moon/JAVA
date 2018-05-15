package util;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionUtil {

private static SqlSessionFactory factory;

	static {
	
		try {
		
			//mybatis-config.xml을 읽어오는 객체
			Reader reader = Resources.getResourceAsReader("config/mybatis-config.xml");
			
			//SqlSessionFactoryBuilder
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			
			//SqlSessionFactory
			factory = builder.build(reader);
		
		}catch(Exception e) {
			e.printStackTrace();
		}//try~catch end
		
	}//static end

	public static SqlSession getSession() {
		return factory.openSession(true);
	}//getSession() end

}//SqlSessionUtil end

