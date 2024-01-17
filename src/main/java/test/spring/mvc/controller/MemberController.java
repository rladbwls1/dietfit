package test.spring.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//īī�� �α��� 
	@RequestMapping("check")
	public @ResponseBody Member_basicDTO doCheck(String email,Model model) {
		Member_basicDTO dto=new Member_basicDTO();
		// db ���� email üũ 
		// ���� email �ٷ� insert
		if(service.registerEmailCheck(email)<1) {
			dto.setId(service.getRamdomPassword());
			dto.setPw(dto.getId());
			dto.setName("�׽�Ʈ");
			dto.setNic("");
			dto.setEmail(email);
			service.newMember(dto, 10);
		}
		dto=service.getIdPw(email);
		return dto;
	}
	
	@RequestMapping("test")
	public String doTest() {
		return "member/test";
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
	
	//�Ϲ� �α���
	@RequestMapping("customLogin")
	public String doLogin(@RequestParam(value = "exception", required = false)String exception,
			Model model) {
		model.addAttribute("exception",exception);
		return "member/loginForm";
	}

	//�Ϲ� ȸ������ ��
	@RequestMapping("registerForm")
	public String register() {
		return "member/registerForm";
	}
	//�Ϲ� ȸ������ 
	@RequestMapping("registerPro")
	public String registerPro(Member_basicDTO dto) {
		int path=99;
		service.newMember(dto,path);
		return "redirect:/member/customLogin";
	}
	
	@RequestMapping("idCheck")
	public @ResponseBody boolean idCheck(String id) {
		boolean check=false;
		if(service.registerIdCheck(id)<1) {
			check=true;
		}
		return check;
	}
	@RequestMapping("emailCheck")
	public @ResponseBody boolean emailCheck(String email) {
		boolean check=false;
		if(service.registerEmailCheck(email)<1) {
			check=true;
		}
		return check;
	}
	
	
	
}
