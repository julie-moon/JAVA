package app;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import service.IdolsService;
import vo.Idol;

public class IdolListApp {

	public static void main(String[] args) {
		
		ApplicationContext factory = new ClassPathXmlApplicationContext("config/applicationContext.xml");
		
		IdolsService service = (IdolsService)factory.getBean("idolsService");
		
		List<Idol> list = service.idolList();
		
		for(Idol idol : list) {
			System.out.println("번호 : " + idol.getNo());
			System.out.println("이름 : " + idol.getName());
			System.out.println("키 : " + idol.getHeight());
			System.out.println("몸무게 : " + idol.getWeight());
			System.out.println("생년월일 : " + idol.getBirthDate());
			System.out.println("그룹 번호 : " + idol.getGroupNo());
			System.out.println("-------------------------------------");
		} // for end
		
	} // main() end
	
} // IdolListApp end
