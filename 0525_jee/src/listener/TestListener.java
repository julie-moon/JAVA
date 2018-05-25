package listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class TestListener implements HttpSessionListener{

	/*
		리스너는 WAS에서 발생하는 이벤트를 처리하는 클래스
		(자바스크립트에서 이벤트리스너와 같은 기능)
		
		서버 켜고, 끄고
		세션 생성, 소멸
		세션의 속성이 변경되는 것 등
	*/
	
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		String id = arg0.getSession().getId();
		System.out.println("세션 생성-!");
		System.out.println(id);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		String id = arg0.getSession().getId();
		System.out.println("세션 소멸-!");
		System.out.println(id);
	}
	
}
