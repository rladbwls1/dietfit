package test.spring.mvc.controller;

import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.service.SellerService;


@Controller
@RequestMapping("/seller/*")
public class SellerController {
	
	@Autowired
	private SellerService service;
	
	@RequestMapping("/store/{companyid}")
	public String getProductsByCompanyId(@PathVariable("companyid") String companyid, Model model) {
	    List<ProductDTO> products = service.findallproductbycompanyid(companyid);
	    if (products != null) {
	        for (ProductDTO product : products) {
	            List<ProductimgDTO> thumImages = service.findthumimg(
	                    companyid, product.getCategory(),
	                    product.getCategory2(), product.getFlavor());
	            product.setImages(thumImages);
	        }
	        model.addAttribute("products", products);
	    }
	    return "seller2/productList";
	}
	
	@RequestMapping("/store/home")
	public String main() {
		return "seller2/home";
	}
	
	@RequestMapping("/coupon/request")
    public String showCouponRequestForm(Model model) {
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
    public String chat(@RequestParam("productId") String productId,Model model) {
		model.addAttribute("productId", productId);
        return "/seller2/chat";
    }

	
	@RequestMapping("/modify")
    public String modify() {
        return "/seller2/sellermodifyform";
    }
	@RequestMapping("/modifyPro")
	public String modifyPro() {
		return "";
	}
	@RequestMapping("/withdrawpro")
	public String withdrawpro() {
		return "";
	}
	@RequestMapping("/mypage")
	public String mypage() {
		return "/seller2/mypage";
	}
	@RequestMapping("/productdiscount")
	public String productdiscount() {
		return "/seller2/productdiscount";
	}
	
}

