package test.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("companylist")
	public String companyList(Model model) {
		service.companyList(model);
		return "admin/company/list";
	}
	@RequestMapping("companyDetail")
	public String companyDetail(Model model, String id) {
		Member_detailDTO companyDetail = service.companyDetail(id);
        model.addAttribute("companyDetail", companyDetail);
        model.addAttribute("id", id);
        return "admin/company/detailList";
	}
	

}
