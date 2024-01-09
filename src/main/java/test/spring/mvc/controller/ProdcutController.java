package test.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.service.SellerService;


@Controller
@RequestMapping("/seller/product/*")
public class ProdcutController {

    @Autowired
    private SellerService sellerService;

    @GetMapping("/details/{companyid}/{category}/{category2}/{flavor}")
    public String detail(@PathVariable ("companyid") String companyid,
                         @PathVariable ("category") String category,
                         @PathVariable ("category2") String category2,
                         @PathVariable ("flavor") String flavor,
                         Model model) {
        // 여기에서 필요한 로직을 수행하고, 필요한 데이터를 모델에 추가하세요
        ProductDTO product = sellerService.findproductdetail(companyid, category, category2, flavor);
        model.addAttribute("product", product);

        return "seller2/productdetail";
    }
}


