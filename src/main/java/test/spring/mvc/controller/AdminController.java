package test.spring.mvc.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.service.AdminService;
import test.spring.mvc.service.EmailService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private EmailService eservice;
	
	@RequestMapping("companylist")
	public String companyList(Model model, @RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		service.companyList(pageNum, model); //결과는 model에
		return "admin/company/list";
	}
	@RequestMapping("companyDetail")
	public String companyDetail(String id, Model model) {
		Member_detailDTO companyDetail = service.companyDetail(id);
        model.addAttribute("companyDetail", companyDetail);
        return "admin/company/detailList";
	}
	@RequestMapping("allProduct")
	public String allProduct(Model model, @RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		service.allProduct(pageNum, model);
		return "admin/company/allProduct";
	}
	
	@RequestMapping("companyProduct")
	public String companyProduct(String companyid, Model model,
			 @RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		service.productList(pageNum, model, companyid);
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

	@RequestMapping("checkStock")
	public @ResponseBody String checkStock() {
		service.checkStock();
		return "stock check, mail Send!";
	}

	  
}
