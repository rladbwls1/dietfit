package test.spring.mvc.controller;

import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import test.spring.mvc.bean.CartDTO;
import test.spring.mvc.bean.CouponDTO;
import test.spring.mvc.bean.DeliveryDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
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
	@RequestMapping("seller")
	public String seller() {
		return "member/seller";
	}
	@RequestMapping("admin")
	public String admin() {
		return "member/admin";
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
		return "redirect:/dietfit/main";
	}	
	
	@RequestMapping("productList")
	public String productList(@RequestParam(value="pageNum", defaultValue="1") int pageNum,
					Model model,Principal pri) {
		//int number=0;
		//number=count-(currentPage-1)*pageSize;
		if(pri!=null) {
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
	public @ResponseBody String removeWishList2(Principal pri,String products,String checkedFolder) {
		String id=pri.getName();
		service.removeWishMore(products,id,checkedFolder);
		return "bye";
	}
	@RequestMapping("wishConfirm")
	public String wishConfirm() {
		return "member/wishConfirm";
	}
	@RequestMapping("wishList")
	public String wishList(Model model, Principal pri,
			@RequestParam(value="checkedFolder", defaultValue="전체") String checkedFolder) {
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
	//관심상품 폴더 변경하기
	@RequestMapping("wishFolderChangePro")
	public @ResponseBody String wishFolderChangePro(
			Principal pri,String checkedFolder, String products) {
		String id=pri.getName();
		service.changeFolder(checkedFolder,products,id);
		return "bye";
	}
	@RequestMapping("miniCart")
	public String miniCart(Model model, String companyid,
			String category,String category2, String price) {
		model.addAttribute("price",price);
		model.addAttribute("list",mapper.getProductByCompanyidCateCate2(companyid, category, category2));
		return "member/miniCart";
	}
	
	@RequestMapping("addCartOne")
	public @ResponseBody String addCartOne(Principal pri ,String product, int quantity, int price) {
		service.addCartOne(pri.getName(),product,quantity,price);
		return "hi";
	}
	@RequestMapping("addCartMore")
	public @ResponseBody String addCartMore(Principal pri ,String products) {
		service.addCartMore(pri.getName(),products);
		return "hi";
	}
	
	@RequestMapping("cartList")
	public String cartList(Model model,Principal pri) {
		service.getCartList(model, pri.getName());
		return "member/cartList";
	}
	@RequestMapping("updateCartQuantity")
	public @ResponseBody String updateCartQuantity(Model model, Principal pri, int num, int quantity) {
		service.updateCartQuantity(pri.getName(),num,quantity);
		CartDTO dto=mapper.getCartListByNum(pri.getName(), num);
		ObjectMapper om=new ObjectMapper();
		String js="";
		try {
			js = om.writeValueAsString(dto);   //문자열로 변경
		} catch (JsonProcessingException e) {	e.printStackTrace();	}  
		return js;
	}
	@RequestMapping("deleteCart")
	public @ResponseBody String deleteCart(Model model, Principal pri, int num) {
		service.deleteCart(pri.getName(), num);
		return "hi";
	}
	
	@RequestMapping("addDelivery")
	public String addDelivery() {
		return "member/addDelivery";
	}
	@RequestMapping("addDeliveryPro")
	public String addDeliveryPro(DeliveryDTO dto,Principal pri,Model model) {
		int result=mapper.checkNicaddr(pri.getName(), dto.getNicaddr());
		if(result!=1) {
			service.addDelivery(dto,pri.getName());
		}
		model.addAttribute("result",result);
		return "member/addDeliveryPro";
	}
	@RequestMapping("userDelivery")
	public String userDelivery(Principal pri,Model model) {
		model.addAttribute("id",pri.getName());
		model.addAttribute("list",mapper.getUserDelivery(pri.getName()));
		return "member/userDelivery";
	}
	@RequestMapping("setDefaultDelivery")
	public String setDefaultDelivery(Principal pri,String nicaddr) {
		service.setDefaultDelivery(pri.getName(),nicaddr);
		return "redirect:/member/userDelivery";
	}
	@RequestMapping("deleteDelivery")
	public @ResponseBody String deleteDelivery(Principal pri,String nicaddr) {
		service.deleteDelivery(pri.getName(),nicaddr);
		return "bye";
	}
	//쿠폰 다운로드 함
	@RequestMapping("coupondownload")
	public String coupondownload(Model model,Principal pri) {
		service.couponList(model);
		model.addAttribute("userList",mapper.getUserCouponid(pri.getName()));
		return "admin/coupon/couponList";
	}
	@RequestMapping("coupondownloadPro")
	public String coupondownloadPro(CouponDTO cdto,Principal pri) {
			cdto.setStatus(0);
			service.downloadCoupon(pri.getName(),cdto);
		return "redirect:/member/coupondownload";
	}
	//내 쿠폰함
	@RequestMapping("myCoupon")
	public String myCoupon(Principal pri,Model model) {
		model.addAttribute("list",service.getUserCoupon(pri.getName()));
		return "member/myCoupon";
	}
	//주문,배송
	@RequestMapping("myOrder")
	public String myOrder(Principal pri,Model model) {
		service.getUserOrder(pri.getName(),model);
		return "member/myOrder";
	}
	@RequestMapping("myOrderDetail")
	public String myOrderDetail(String id, String orderid,Model model) {
		model.addAttribute("orderid",orderid);
		model.addAttribute("dto",mapper.getDeliveryByOrderid(id, orderid));
		service.getOrderDetailByOrderid(id, orderid,model);
		return "member/myOrderDetail";
	}
	//구매확정
	@RequestMapping("defintePurchase")
	public @ResponseBody String defintePurchase(Principal pri,String orderid,String productid) {
		service.defintePurchase(pri.getName(),orderid,productid);
		return "bye";
	}
	
}
