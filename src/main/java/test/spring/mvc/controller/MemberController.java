package test.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping("all")
	public String doAll() {
		return "member/all";
	}
	@RequestMapping("seller")
	public String doMember() {
		return "member/seller";
	}
	@RequestMapping("admin")
	public String doAdmin() {
		return "member/admin";
	}
	
	//���� ���� ���� 
	@RequestMapping("accessError")
	public String accessError(Authentication auth) {
		System.out.println("access Denied===>>"+auth);
		return "member/accessError";
	}
	//�α���
	@RequestMapping("customLogin")
	public String doLogin() {
		return "member/login";
	}

	//ȸ������ ��
	@RequestMapping("registerForm")
	public String register() {
		return "member/registerForm";
	}
	//ȸ������ 
	@RequestMapping("registerPro")
	public String registerPro(Member_basicDTO dto) {
		service.newMember(dto);
		return "redirect:/member/customLogin";
	}
}
