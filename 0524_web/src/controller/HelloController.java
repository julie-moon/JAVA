package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class HelloController {

	/*
		유저가 hello.html을 요청하면 여기에 옴 
	*/
	
	@RequestMapping("/hello.html")
	public void wingging() {
		
		// System.out.println("여기 호출-!");
		
		/*
			View 리턴자료형 
			1) InternalResourceView(JSPView)
			2) RedirectView(redirect 방식)
			3) JacksonJsonView(json)
		*/
		
		/*
			View view = null;
			
			// view = new RedirectView("http://www.naver.com");
			// view = new InternalResourceView("/WEB-INF/view/hello.jsp"); // WEB-INF/view/hello.jsp를 view로 설정
			
			return view;
		*/
		
		/* 리턴자료형을 String으로 했을 때 
			return "hello"; // hello-servlet.xml에 prefix / suffix 처리 해뒀음
		*/
		
	} // wingging() end
	
	@RequestMapping("/index.html")
	public void index() {
		
	}
	
} // HelloController end
