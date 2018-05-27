package controller;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import service.IdolsService;
import service.UsersService;
import vo.Idol;
import vo.User;

@Controller
public class UsersController {
	
	// 나중에 바뀌더라도 작동할 수 있도록 인터페이스로 
	private UsersService service;
	private IdolsService idolsService;
	
	public void setService(UsersService usersService) {
		this.service = usersService;
	}

	public void setIdolsService(IdolsService idolsService) {
		this.idolsService = idolsService;
	}
	
	@RequestMapping("/test.jbm")
	public String test() {
		return "template";
	} // test() end
	
	@RequestMapping(value="/join.jbm", method=RequestMethod.GET) /* RequestMethod.GET */
	public void joinForm() { // 회원가입 폼
		// System.out.println("겟방식");
	} // joinForm() end
	
	@RequestMapping(value="/join.jbm", method=RequestMethod.POST) /* RequestMethod.POST */
	public void join(User user) { // 회원가입
		
		System.out.println(user.getId());
		System.out.println(user.getPassword());
		System.out.println(user.getNickname());
		
		// service.join(user);
		
		// System.out.println("포스트방식");
		// return "redirect:index.jbm";
		
	} // join() end
	
	// index.jbm
	@RequestMapping("/index.jbm")
	public void index(Model model) {
	
		List<Idol> list = idolsService.idolList();
		
		// view에 출력하기 위해서는 Model 객체 필요함
		model.addAttribute("list", list);
		
	} // index() end
	
	// login.jbm 
	@RequestMapping("/login.jbm")
	public String login(User user, HttpSession session) { /* @RequestParam String id, @RequestParam String password */
		
		// System.out.println("id : " + id);
		// System.out.println("password : " + password);
		
		// 스프링은 User 객체 만들고, 넘어오는 파라미터와 멤버필드의 이름이 같을 경우 값을 세팅해줌
		// System.out.println(user.getId());
		// System.out.println(user.getPassword());
		
		session.setAttribute("loginUser", service.loginUser(user));
		
		// 리턴자료형이 View일 때
		// return new RedirectView("index.jbm");
		
		// 리다이렉트 뷰
		return "redirect:index.jbm";
		
	} // login() end
	
	// logout.jbm
	@RequestMapping("/logout.jbm")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:index.jbm";
		
	} // logout() end
	
}