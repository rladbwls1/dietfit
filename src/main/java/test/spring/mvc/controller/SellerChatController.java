package test.spring.mvc.controller;

import java.io.File;
import java.security.Principal;
import java.util.Scanner;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

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
    public String chat(Model model,Principal pri,@RequestParam("product") String product,
    		String companyid,ChatDTO chatdto, HttpServletRequest request)throws Exception {
		String id = pri.getName();
		chatdto.setId(id);
		chatdto.setProduct(product);
		String sellercompany = service.findcompanyidbyproductid(companyid);
		int roomnum =service.chatroomnum(chatdto, model,id,product);
		
		// 서버의 실제 경로를 얻습니다.
	    ServletContext servletContext = request.getServletContext();
	    String realPath2 = servletContext.getRealPath("/resources/chat/");
	    String realPath = realPath2 + roomnum+".txt";
	    
	      File file = new File(realPath);
	      if(file.isFile()) {
	    	  Scanner s = new Scanner(file);
	    	  String chat = "";
	    	  while(s.hasNextLine()) {
	    		  chat += (s.nextLine()+"<br>");
	    	  }
	    	  model.addAttribute("chat",chat);
	      }
		
		model.addAttribute("sellercompany",sellercompany);
		model.addAttribute("id", id);
		model.addAttribute("product", product);
        return "/seller2/chat";
    }

}

