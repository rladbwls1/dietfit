package test.spring.mvc.controller;

import java.nio.file.Paths;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@GetMapping("/{companyid}/{category}/{category2}/{flavor}/{num}/{ext}/{thum}")
	public String getImageUrl(@PathVariable String companyid,
	                          @PathVariable String category,
	                          @PathVariable String category2,
	                          @PathVariable String flavor,
	                          @PathVariable String num,
	                          @PathVariable String ext,
	                          @PathVariable String thum) {
	    // 이미지 파일이 저장된 디렉토리 경로 설정 (예: 바탕화면-식단파일)
	    String directoryPath = "C:\\Users\\y\\Desktop\\dietfitfile";

	    // 이미지 파일의 전체 경로 생성
	    String filename = companyid + category + category2 + flavor + num + ext;
	    String imagePath = Paths.get(directoryPath, filename).toString();

	    // 이미지 파일의 URL로 변환하여 반환
	    return "file:" + imagePath;
	}
	
	@RequestMapping("/coupon/request")
    public String showCouponRequestForm(Model model) {
        model.addAttribute("couponRequest", new AllcouponDTO());
        return "/seller2/couponrequestForm";
    }

	@PostMapping("/coupon/request")
    public String handleCouponRequest(@ModelAttribute("couponRequest") AllcouponDTO couponRequest, Model model) {
        // 쿠폰 발행 요청을 서비스로 전달
        service.addCoupon(couponRequest);
        return "/seller2/couponrequestresult";
   	}

}

