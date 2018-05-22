package ver4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import util.ActorPrinter;
import vo.Actor;

public class ActorApp {

	public static void main(String[] args) {
		
		ApplicationContext factory = new ClassPathXmlApplicationContext("config/applicationContext.xml");
		
		/*
		Actor actor = (Actor)factory.getBean("a2");
		System.out.println(actor.getName());
		System.out.println(actor.getHeight());
		System.out.println(actor.getWeight());
		*/
		
		ActorPrinter ap = (ActorPrinter)factory.getBean("ap"); /* getBean 메소드 안 "ap"는 applicationContext.xml파일 bean id="ap" */ 
		ap.printActor();
		
	} // main() end
	
}
