package test.spring.mvc.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.spring.mvc.bean.ChatDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.service.SellerService;

@Controller
@RequestMapping("/sellerchat/*")
public class SellerChatController {
	
	@Autowired
	private SellerService service;
	
	@RequestMapping("/chat")
    public String chat(Model model,Principal pri,@RequestParam("product") String product, String companyid,ChatDTO chatdto) {
		String id = pri.getName();
		chatdto.setId(id);
		chatdto.setProduct(product);
		String sellercompany = service.findcompanyidbyproductid(companyid);
		service.chatroomnum(chatdto, model,id,product);
		
		model.addAttribute("sellercompany",sellercompany);
		model.addAttribute("id", id);
		model.addAttribute("product", product);
        return "/seller2/chat";
    }

}

