package test.spring.mvc.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;
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
		return "member/signInUp";
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
	@RequestMapping("userDelete")
	public String userDelete(String id,Model model) {
		model.addAttribute("id",id);
		return "member/userDelete";
	}	
	@RequestMapping("deletePro")
	public @ResponseBody boolean deletePro(String id, String pw){
		boolean check=service.pwCheck(id, pw);
		if(check) {
			service.deleteUserself(id);
		}
		return check;
	}	
	@RequestMapping("deletePro2")
	public String deletePro2(String id, HttpSession session){
		System.out.println("deletePro2�Ѿ��");
		return "redirect:/dietfit/main";
	}	
	
	
	//-----------------------------------------------------------------------0122
	@RequestMapping("productList")
	public String productList(Model model,@RequestParam(value="pageNum", defaultValue="1") int pageNum
							,Principal pri) {
		//int number=0;
		//number=count-(currentPage-1)*pageSize;
		if(pri.getName()!=null) {
			service.getWishListProduct(model,pri.getName());
		}
		service.getallproduct(model,pageNum);
	    return "member/productList";
	}
	@RequestMapping("productDetail")
	public String productDetail(Model model,String companyid,String category,
							String category2, String flavor) {
		service.getProductDetail(companyid,category,category2,flavor,model);
		return "member/productDetail";
	}
	
	@RequestMapping("addWishList")
	public @ResponseBody String addWishList(Principal pri,String product) {
		String id=pri.getName();
		service.addWishOne(product,id);
		return "hi";
	}
	@RequestMapping("removeWishList")
	public @ResponseBody String removeWishList(Principal pri,String product) {
		String id=pri.getName();
		service.removeWishOne(product,id);
		return "bye";
	}
	@RequestMapping("removeWishList2")
	public @ResponseBody String removeWishList2(Principal pri,String products) {
		String id=pri.getName();
		service.removeWishMore(products,id);
		return "bye";
	}
	@RequestMapping("wishConfirm")
	public String wishConfirm() {
		return "member/wishConfirm";
	}
	@RequestMapping("wishList")
	public String wishList(Model model, Principal pri,
			@RequestParam(value="checkedFolder", defaultValue="��ü") String checkedFolder) {
		String id=pri.getName();
		model.addAttribute("checkedFolder",checkedFolder);
		service.getWishList(model, id);
		return "member/wishList";
	}
	@RequestMapping("getProductCode")
	public @ResponseBody ProductDTO getProductCode(String product) {
		return mapper.getProductCodeByProductName(product);
	}
	@RequestMapping("wishFolderChange")
	public String wishFolderChange(Principal pri,Model model,
					String checkedFolder,String products) {
		String id=pri.getName();
		model.addAttribute("folderNames",mapper.getWishFolderName(id));
		model.addAttribute("checkedFolder",checkedFolder);
		model.addAttribute("products",products);
		return "member/wishFolderChange";
	}
	@RequestMapping("wishFolderChangePro")
	public @ResponseBody String wishFolderChangePro(
			Principal pri,String checkedFolder, String products) {
		//checkedFolder : ����, �ƺ�
		//products : 54, 53
		
		return "bye";
	}
	
	
	
	
	
}
