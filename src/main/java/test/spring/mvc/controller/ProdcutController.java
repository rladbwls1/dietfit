package test.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/seller/*")
public class ProdcutController {
	
	@RequestMapping("main")
	public String main() {
		return "product/";
	}

}
