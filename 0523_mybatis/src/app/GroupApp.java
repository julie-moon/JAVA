package app;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.GroupsDAO;
import vo.Group;

public class GroupApp {

	public static void main(String[] args) {
		
		ApplicationContext factory = new ClassPathXmlApplicationContext("config/applicationContext.xml");
		
		GroupsDAO dao = (GroupsDAO)factory.getBean("groupsDAO");
		
		List<Group> list = dao.selectList();
		
		for (Group group : list) {
			
			System.out.println(group.getNo());
			System.out.println(group.getName());
			System.out.println(group.getDebutDate());
			
		} // for end
		
	} // main() end
	
} // GroupApp
