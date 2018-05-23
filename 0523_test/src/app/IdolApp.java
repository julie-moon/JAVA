package app;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.IdolsDAO;
import vo.Idol;

public class IdolApp {

	public static void main(String[] args) {
		
		ApplicationContext factory = new ClassPathXmlApplicationContext("config/applicationContext.xml");
		
		IdolsDAO dao = (IdolsDAO)factory.getBean("IdolsDAO");
		
		List<Idol> list = dao.selectList();
		
		for (Idol idol : list) {
			
			System.out.println("번호 : " + idol.getNo());
			System.out.println("이름 : " + idol.getName());
			System.out.println("키 : " + idol.getHeight());
			System.out.println("몸무게 : " + idol.getWeight());
			System.out.println("생년월일 : " + idol.getBirthDate());
			System.out.println("그룹 번호 : " + idol.getGroupNo());
			System.out.println("------------------------------------------");
			
		} // for end

	} // main() end

} // IdolApp end
