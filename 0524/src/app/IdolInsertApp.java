package app;

import java.sql.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.IdolsDAO;
import service.IdolsService;
import vo.Idol;

public class IdolInsertApp {

	public static void main(String[] args) {
		
		ApplicationContext factory = new ClassPathXmlApplicationContext("config/applicationContext.xml");
		
		IdolsService service = (IdolsService)factory.getBean("idolsService");
		
		// Idol 객체
		Idol idol = new Idol();
		idol.setName("최유정");
		idol.setHeight(157);
		idol.setWeight(45);
		Date birthDate = Date.valueOf("1999-11-12");
		idol.setBirthDate(birthDate);
		idol.setGroupNo(21);
		
		int result = service.addIdol(idol);
		
		System.out.println(result);
		
	} // main() end

} // IdolApp end
