package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.MembersService;
import vo.Member;

@Controller
public class MembersController {
	
	private MembersService service;

	public void setService(MembersService service) {
		this.service = service;
	}

	@RequestMapping("/index.html")
	public void index(Model model) { // model 객체는 데이터 그 자체 
		
		model.addAttribute("name", "박지훈");
		
		/*
		List<Member> list = new ArrayList<>();
		list.add(new Member("sparrow", "1111", "참새"));
		list.add(new Member("babpul", "1111", "윤리더"));
		list.add(new Member("deep", "1111", "딥"));
		
		model.addAttribute("list", list);
		*/
		
		List<Member> list = service.memberList();
		model.addAttribute("list", list);
		
	} // index() end
	
}
