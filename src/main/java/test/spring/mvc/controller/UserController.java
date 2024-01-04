package test.spring.mvc.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	@RequestMapping("/user/all")
	public String doAll() {
		return "user/all";
	}
	@RequestMapping("/user1/member")
	public String doMember() {
		return "user/member";
	}
	@RequestMapping("/user2/admin")
	public String doAdmin() {
		return "user/admin";
	}
	
	//접근 제한 에러 
	@RequestMapping("/user/accessError")
	public String accessError(Authentication auth) {
		System.out.println("access Denied===>>"+auth);
		return "user/accessError";
	}
	//로그인
	@RequestMapping("/user/customLogin")
	public String doLogin() {
		return "user/login";
	}
	//로그아웃
	@RequestMapping("user/customLogout")
	public String doLogout() {
		return "redirect:/user/all";
	}

}
