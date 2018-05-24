package app;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import service.IdolsService;

public class IdolDeleteApp {

	public static void main(String[] args) {
		
		ApplicationContext factory = new ClassPathXmlApplicationContext("config/applicationContext.xml");
		
		IdolsService service = (IdolsService)factory.getBean("idolsService");
		
		int no = 22;
		
		int result = service.deleteIdol(no);
		
		System.out.println(result);
		
	} // main() end
	
} // IdolDeleteApp end
