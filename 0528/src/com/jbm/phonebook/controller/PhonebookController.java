package com.jbm.phonebook.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jbm.phonebook.service.HostsService;
import com.jbm.phonebook.service.PhonebookService;
import com.jbm.phonebook.vo.Host;
import com.jbm.phonebook.vo.Phone;

@Controller
public class PhonebookController {

	private HostsService hostsService;
	private PhonebookService phonebookService;
	// private HttpSession httpSession;
	
	public void setHostsService(HostsService hostsService) {
		this.hostsService = hostsService;
	}
	
	public void setPhonebookService(PhonebookService phonebookService) {
		this.phonebookService = phonebookService;
	}
	
	@RequestMapping("/index.pb")
	public void index() {
		
	} // index() end
	
	@RequestMapping("/main.pb")
	public void main(Model model, HttpSession session) {
		
		Host loginUser = (Host)session.getAttribute("loginUser");
		// System.out.println("로그인 유저의 no : " + loginUser.getNo());
		
		int hostNo = loginUser.getNo();
		
		List<Phone> list = phonebookService.phonebookList(hostNo);
		model.addAttribute("list", list);
		
	} // main() end
	
	@RequestMapping(value="/insert.pb", method=RequestMethod.GET)
	public void insertForm(Phone phone) { // 전화번호 입력 폼
		
	} // form() end
	
	@RequestMapping(value="/insert.pb", method=RequestMethod.POST)
	public String insert(Phone phone, HttpSession session) { // 전화번호 입력
		
		Host loginUser = (Host)session.getAttribute("loginUser");
		// System.out.println("로그인 유저의 no : " + loginUser.getNo());
		
		int hostNo = loginUser.getNo();
		phone.setHostNo(hostNo);
		
		// System.out.println(phone.getHostNo());
		// System.out.println(phone.getName());
		// System.out.println(phone.getPhone());
		// System.out.println(phone.getBirthDate());
		// System.out.println(phone.getGender());
		
		phonebookService.addPhonebook(phone);
		
		return "redirect:main.pb";
		
	} // insert() end
	
	@RequestMapping("/delete.pb")
	public String delete(int no) {
		
		phonebookService.deletePhonebook(no);
		
		return "redirect:main.pb";
		
	} // delete() end
	
	@RequestMapping("/login.pb")
	public String login(Host host, HttpSession session) {
		
		// System.out.println("id : " + host.getId());
		// System.out.println("password : " + host.getPassword());
		
		session.setAttribute("loginUser", hostsService.loginUser(host));
		
		return "redirect:main.pb";
		
	} // login() end
	
	@RequestMapping("/logout.pb")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:index.pb";
		
	} // logout() end

}
