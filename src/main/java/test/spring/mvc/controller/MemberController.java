package test.spring.mvc.controller;

import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import test.spring.mvc.bean.DiscountDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.repository.MemberMapper;
import test.spring.mvc.service.Admin1ServiceImpl;
import test.spring.mvc.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private Admin1ServiceImpl admin;
	
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
	
	// 베스트 상품 월간
	@RequestMapping("best")
	public String best(Model model) {
		List<ProductDTO> dto = admin.best();
		if(dto != null) {
			for(ProductDTO pd : dto) {
				ProductimgDTO img = admin.pro_img(pd.getCompanyid(), pd.getCategory(), pd.getCategory2());
				if (img != null) {
	                String imagePath = "/resources/p_img/" + img.getCompanyid() +
	                                   img.getCategory() + img.getCategory2() +
	                                   img.getFlavor() + "F" + img.getNum() +
	                                   img.getExt();
	               pd.setImagePath(imagePath);
	            }
			}
		}
		model.addAttribute("best", dto);
		return "member/best";
	}
	
	// 베스트 상품 주간
	@RequestMapping("best2")
	public String best2(Model model) {
		List<ProductDTO> dto = admin.best2();
		if(dto != null) {
			for(ProductDTO pd : dto) {
				ProductimgDTO img = admin.pro_img(pd.getCompanyid(), pd.getCategory(), pd.getCategory2());
				if (img != null) {
	                String imagePath = "/resources/p_img/" + img.getCompanyid() +
	                                   img.getCategory() + img.getCategory2() +
	                                   img.getFlavor() + "F" + img.getNum() +
	                                   img.getExt();
	               pd.setImagePath(imagePath);
	            }
			}
		}
		model.addAttribute("best", dto);
		return "/member/best2";
	}
	
	// 오늘의 특가 상품
	@RequestMapping("discount")
	public String discount(Model model) {
		List<ProductDTO> dto = admin.discount();
		if(dto != null) {
			for(ProductDTO pd : dto) {
				ProductimgDTO img = admin.pro_img(pd.getCompanyid(), pd.getCategory(), pd.getCategory2());
				int sale = admin.sale(pd.getNum());
				if (img != null) {
	                String imagePath = "/resources/p_img/" + img.getCompanyid() +
	                                   img.getCategory() + img.getCategory2() +
	                                   img.getFlavor() + "F" + img.getNum() +
	                                   img.getExt();
	               pd.setImagePath(imagePath);
	               pd.setSale(sale);
	            }
			}
		}
		model.addAttribute("discount", dto);
		return "/member/discount";
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
	//판매자 회원가입 
	@RequestMapping("registerPro2")
	public String registerPro2(Member_basicDTO bdto,Member_detailDTO ddto) {
		int path=99;
		service.newMember2(bdto,ddto,path);
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
	public String productDetail(Model model,Principal pri,
							String companyid,String category,
							String category2, String flavor,
							HttpServletRequest request,
	                        HttpServletResponse response) {
		List<String> thumbnailPaths=service.getProductDetail(companyid,category,category2,flavor,model);
		// 로그인 한 경우, 최근 본 상품 정보를 쿠키에 추가
        if(pri!=null) {
		addRecentlyViewedProductToCookie(request, response, companyid + category + category2 + flavor, pri.getName(), 
        		model, "/details/" + companyid + "/" + category + "/" + category2 + "/" + flavor, thumbnailPaths);
        }
		return "member/productDetail";
	}
	
	//최근본상품 시작 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("RecentViewProduct")
    public String recentViewProduct(Model model, Principal pri, HttpServletRequest request) {
        String id = pri.getName(); // 사용자 ID 얻어오기

        // 쿠키에서 최근 본 상품 정보를 읽어옴
        String recentlyViewedProduct = getRecentlyViewedProductFromCookie(request, id);

        // 최근 본 상품 정보를 리스트로 변환 (예시로 문자열로 표현)
        List<String> recentlyViewedProducts = Arrays.asList(recentlyViewedProduct.split("/"));
        service.getProductByCookie(recentlyViewedProducts,model);
        
        model.addAttribute("recentlyViewedProducts", recentlyViewedProducts);
        model.addAttribute("id", id);

        return "member/RecentViewProduct";
    }	 
	
	private void addRecentlyViewedProductToCookie(HttpServletRequest request, HttpServletResponse response, String productId, String id, Model model, String productUrl, List<String> thumbnailPaths) {
	        String recentlyViewedProduct = getRecentlyViewedProductFromCookie(request, id);

	     // 기존 쿠키 값이 없으면 새로 생성
	        if (recentlyViewedProduct == null) {
	            recentlyViewedProduct = productId;
	        } else {
	            String[] productArray = splitProducts(recentlyViewedProduct);

	            // 중복 체크
	            if (!containsProduct(productArray, productId)) {
	                recentlyViewedProduct += "/" + productId;
	            }
	        }

	        // 쿠키 값 "/" 기준으로 나누기
	        String[] productArray = splitProducts(recentlyViewedProduct);

	        // JSP에 전달하기 위해 배열을 문자열로 조합
	        String joinedProducts = String.join("/", productArray);

	        Cookie cookie = new Cookie("recentlyViewed_" + id, joinedProducts);
	        model.addAttribute("recentlyViewedProducts", joinedProducts);
	        cookie.setMaxAge(24 * 60 * 60); // 쿠키의 유효 시간 (초 단위), 여기서는 1일로 설정
	        //cookie.setMaxAge(60); // 1분으로 설정
	        cookie.setPath("/"); // 쿠키의 경로 설정
	        response.addCookie(cookie);
    }
	 private String[] splitProducts(String products) {
        if (products != null && !products.isEmpty()) {
            return products.split("/");
        }
        return new String[0];
    }
    private boolean containsProduct(String[] products, String productId) {
        for (String product : products) {
            if (product.equals(productId)) {
                return true;
            }
        }
        return false;
    }
    private String getRecentlyViewedProductFromCookie(HttpServletRequest request, String id) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (("recentlyViewed_" + id).equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }	
	//최근본상품 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	
	
	
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
	public String miniCart(Model model, int num) {
		service.miniCart(num, model);
		return "member/miniCart";
	}
	
	@RequestMapping("addCartOne")
	public @ResponseBody String addCartOne(Principal pri ,CartDTO dto, int chk) {
		if(chk == 1) {
			dto.setDelivery(1);
		}
		service.addCartOne(pri.getName(),dto.getProduct(),dto.getQuantity(),dto.getPrice(), dto.getDelivery());
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
	@RequestMapping("Rdelivery")
	public String Rdelivery(Model model,Principal pri) {
		service.getCartList(model, pri.getName());
		return "member/Rdelivery";
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
	public @ResponseBody String defintePurchase(Principal pri,
			String orderid,String productid,int price) {
		service.defintePurchase(pri.getName(),orderid,productid,price);
		return "bye";
	}
	@RequestMapping("testPoint")
	public String testPoint(Principal pri,Model model) {
		model.addAttribute("mypoint",service.getPoint(pri.getName()));
		return "member/miniPoint";
	}
	@RequestMapping("myPoint")
	public String myPoint(Principal pri,Model model) {
		model.addAttribute("list", mapper.getPointList(pri.getName()));
		model.addAttribute("myPoint",service.getPoint(pri.getName()));
		return "member/myPoint";
	}
	@RequestMapping("signInUp2")
	public String signInUp2() {
		return "member/signInUp2";
	}
	
}
