package test.spring.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.service.AdminService;
import test.spring.mvc.service.SellerService;

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
	public String companyDetail(String id, Model model) {
		Member_detailDTO companyDetail = service.companyDetail(id);
        model.addAttribute("companyDetail", companyDetail);
        return "admin/company/detailList";
	}
	@RequestMapping("companyProduct")
	public String companyProduct(String companyid, Model model) {
		service.productList(model, companyid);
		return "admin/company/product";
	}
	@RequestMapping("companyStatus")
	public String companyStatus(String id, Model model) {
		Member_basicDTO companyBasic = service.companyBasic(id);
		model.addAttribute("companyBasic", companyBasic);
		return "admin/company/companyStatus";
	}
	@RequestMapping("companyStatusChange")
	public String companyStatusChange(String id, String status) {
		service.companyStatus(id, status);
		return "admin/company/statusChange";
	}
	

}
