package test.spring.mvc.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.mvc.service.SellerService;

@Controller
@RequestMapping("/sellerchat/*")
public class SellerChatController {
	
	@Autowired
	private SellerService service;
	
	@RequestMapping("/chat")
    public String chat(Model model,Principal pri) {
		String id = pri.getName();
		int status = service.findstatus(id);
		model.addAttribute("id", id);
		model.addAttribute("status", status);
        return "/seller2/chat";
    }

}

