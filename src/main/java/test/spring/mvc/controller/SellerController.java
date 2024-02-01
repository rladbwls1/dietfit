package test.spring.mvc.controller;

import java.io.File;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.ChatDTO;
import test.spring.mvc.bean.ChatreportDTO;
import test.spring.mvc.bean.DiscountDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.service.SellerService;


@Controller
@RequestMapping("/seller/*")
public class SellerController {
	
	@Autowired
	private SellerService service;
	
	@RequestMapping("/store/home")
	public String main() {
		return "seller2/home";
	}
	
	@RequestMapping("/coupon/request")
    public String showCouponRequestForm(Principal pri, Model model) {
		String id = pri.getName();
        String companyId = service.findcompanyid(id);
		model.addAttribute("companyId", companyId);
        model.addAttribute("couponRequest", new AllcouponDTO());
        return "/seller2/couponrequestForm";
    }

	@RequestMapping("/coupon/requestPro")
	public String requestPro(@ModelAttribute("couponRequest") AllcouponDTO couponRequest, Model model) {
	    // 쿠폰 발행 요청을 서비스로 전달
	    service.addCoupon(couponRequest);
	    return "/seller2/couponrequestresult";
	}

	@RequestMapping("/chat")
    public String chat() {
        return "/seller2/chat";
	}

	@RequestMapping("/withdrawpro")
	public String withdrawpro(Member_basicDTO Member_basicDTO,Principal pri, Model model) {
		String id = pri.getName();
		model.addAttribute("id", id);
		service.sellerwithdraw(id);
		return "redirect:/member/customLogin";
	}
	
	@RequestMapping("/mypage")
	public String mypage(Principal pri, Model model) {
		model.addAttribute("id", pri.getName());
		return "/seller2/mypage";
	}
	
	@RequestMapping("/SELLERCHAT")
	public String SELLERCHAT(Principal pri, Model model, int roomnum, HttpServletRequest request) throws Exception {
	    String sellerid = pri.getName();
	    String product = service.findallbyroomnum(roomnum);

	    // 서버의 실제 경로를 얻습니다.
	    ServletContext servletContext = request.getServletContext();
	    String realPath2 = servletContext.getRealPath("/resources/chat/");
	    String realPath = realPath2 + roomnum+".txt";

	    File file = new File(realPath);

	    if (file.isFile()) {
	        Scanner s = new Scanner(file);
	        String chat = "";
	        while (s.hasNextLine()) {
	            chat += (s.nextLine() + "<br>");
	        }
	        model.addAttribute("chat", chat);
	    }

	    model.addAttribute("product", product);
	    model.addAttribute("sellerid", sellerid);
	    model.addAttribute("roomnum", roomnum);
	    return "/seller2/SELLERCHAT";
	}
	
	@RequestMapping("/sellerchatlist")
	public String sellerchatlist(Principal pri, Model model) {
		String sellerid = pri.getName();
		model.addAttribute("sellerid", sellerid);
		model.addAttribute("chatlist", service.findnotreadchat(0));
		return "/seller2/sellerchatlist";
	}
	@RequestMapping("/chatreport")
	public String chatreport(Model model,int roomnum) {
		String id = service.findidbyroomnum(roomnum);
		model.addAttribute("id",id);
		model.addAttribute("roomnum",roomnum);
		return "/seller2/chatreport";
	}
	
	@RequestMapping("/chatreportpro")
	public String chatreportpro(ChatreportDTO chatreportdto,int roomnum) {
		service.chatreport(chatreportdto);
		service.chatreportdelete(roomnum);
		return "/seller2/chatreportpro";
	}
	@RequestMapping("/productdiscount")
	public String productdiscount(Model model,Principal pri) {
		model.addAttribute("id", pri.getName());
		model.addAttribute("companyProducts", service.getCompanyProduct(pri.getName()));
		return "/seller2/productdiscount";
	}
	@RequestMapping("/discountForm")
	public String discountForm(int num, Model model) {
		model.addAttribute("num",num);
		return "/seller2/discountForm";
	}
	
	@PostMapping("/addDiscount")
    public String addDiscount(@RequestParam("start") String start,
                              @RequestParam("end") String end,
                              @RequestParam("sale") int sale,
                              @RequestParam("num") String num) {
        DiscountDTO discountDTO = new DiscountDTO();
        discountDTO.setNum(Integer.parseInt(num));
     // 문자열을 Date로 변환
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date startDate = dateFormat.parse(start);
            Date endDate = dateFormat.parse(end);

            discountDTO.setStartr(startDate);
            discountDTO.setEndr(endDate);
        } catch (ParseException e) {
            e.printStackTrace(); // 또는 로그 등으로 기록
        }
        discountDTO.setSale(sale);

        // 할인 정보를 데이터베이스에 추가
        service.updatediscount(discountDTO);
        
        return "redirect:/seller/productdiscount";
    }
	@RequestMapping("/modify")
	public String modify(Principal pri, Model model) {
		String id = pri.getName();
		model.addAttribute("id", id);
		Member_basicDTO member = service.sellermodifyselect(id);
		model.addAttribute("name", member.getName());
		model.addAttribute("nic", member.getNic());
		model.addAttribute("email", member.getEmail());
		return "/seller2/sellermodifyform";
	}
	
	@RequestMapping("/sellerstock")
	public String sellerstock(@RequestParam(name = "productId", required = false) String productId, Model model) {
	    model.addAttribute("productId", productId);
	    if (productId != null && productId.length() >= 8) {
	        // 앞에서부터 2글자씩 잘라내어 각 변수에 저장
	        String companyid = productId.substring(0, 2).trim();
	        String category = productId.substring(2, 4).trim();
	        String category2 = productId.substring(4, 6).trim();
	        String flavor = productId.substring(6, 8).trim();

	        // 모델에 각각의 정보를 추가
	        model.addAttribute("companyid", companyid);
	        model.addAttribute("category", category);
	        model.addAttribute("category2", category2);
	        model.addAttribute("flavor", flavor);
	        
	        // 나머지 로직 수행
	        ProductDTO product = service.sellerstockselect(productId);
	        model.addAttribute("product", product.getProduct());

	    }
	    return "/seller2/sellerstock";
	}

	@RequestMapping("/modifyPro")
	public String modifyPro(Member_basicDTO Member_basicDTO) {
		service.sellermodifyupdate(Member_basicDTO);
		return "/seller2/mypage";
	}
	@RequestMapping("/addStock")
	public String addStock(ProductDTO productdto) {
		System.out.println(productdto.getCompanyid());
		
		service.sellerstockupdate(productdto);
		return "redirect:/seller/mypage";
	}
}

