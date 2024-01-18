package test.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dietfit/*")
public class DietfitController {
	
	@RequestMapping("main")
	public String main() {
		return "main";
	}
	
}
