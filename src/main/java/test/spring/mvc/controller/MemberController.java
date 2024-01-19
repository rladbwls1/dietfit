package test.spring.mvc.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.repository.MemberMapper;
import test.spring.mvc.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private MemberMapper mapper;
	
	@RequestMapping("all")
	public String doAll() {

		return "member/all";
	}
	
	//카카오 로그인 
	@RequestMapping("check")
	public @ResponseBody Member_basicDTO doCheck(String email,Model model) {
		Member_basicDTO dto=new Member_basicDTO();
		// db 에서 email 체크 
		// 없는 email 바로 insert
		if(service.registerEmailCheck(email)<1) {
			dto.setId(service.getRamdomPassword());
			dto.setPw(dto.getId());
			dto.setName("테스트");
			dto.setNic("");
			dto.setEmail(email);
			service.newMember(dto, 10);
		}
		dto=service.getIdPw(email);
		return dto;
	}
	
	//접근 제한 에러 
	@RequestMapping("accessError")
	public String accessError(Authentication auth) {
		System.out.println("access Denied===>>"+auth);
		return "member/accessError";
	}
	
	//일반 로그인
	@RequestMapping("customLogin")
	public String doLogin(@RequestParam(value = "exception", required = false)String exception,
			Model model) {
		model.addAttribute("exception",exception);
		return "member/signInUp";
	}

	//일반 회원가입 
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
	@RequestMapping("sendMail")
	public @ResponseBody void sendMail(String email){
		try {
			service.sendMail(email);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("verifiedEmail")
	public @ResponseBody int verifiedEmail(String email, String emailkey) {
		return service.verifiedCode(email, emailkey);
	}
	@RequestMapping("emailAuth")
	public @ResponseBody void emailAuth(String email) {
		service.emailAuth(email);
	}
	
	@RequestMapping("findId")
	public String findId() {
		return "member/findId";
	}
	
	@RequestMapping("findIdByEmail")
	public @ResponseBody String findIdByEmail(String email) {
		return service.findIdByEmail(email);
	}
	
	@RequestMapping("findPassword")
	public String findPassword() {
		return "member/findPassword";
	}
	@RequestMapping("changePassword")
	public String changePassword(String email, Model model) {
		model.addAttribute("id",service.findIdByEmail(email));
		
		return "member/changePassword";
	}
	@RequestMapping("changePwPro")
	public String changePwPro(String id,String pw) {
		service.changePwById(id, pw);
		return "redirect:/dietfit/main";
	}
	@RequestMapping("modifyForm")
	public String modifyForm(Principal pri,Model model) {
		String id=pri.getName();
		model.addAttribute("id",id);
		model.addAttribute("email",mapper.getEmailById(id));
		model.addAttribute("member",mapper.getUser(id).get(0));
		return "member/modifyForm";
	}
	@RequestMapping("modifyPro")
	public String modifyPro(Member_basicDTO basicDTO, Member_detailDTO detailDTO) {
		service.modifyUser(basicDTO, detailDTO);
		return "redirect:/member/modifyForm";
	}
	@RequestMapping("changeEmail")
	public String changeEmail(String id,Model model) {
		model.addAttribute("id",id);
		return "member/changeEmail";
	}
	@RequestMapping("changeEmailPro")
	public String changeEmailPro(String id,String email) {
		service.changeEmailById(id, email);
		return "redirect:/member/modifyForm";
	}
	
}
