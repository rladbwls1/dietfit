package test.spring.mvc.controller;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.repository.AdminMapper;
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
	public String companyList(Model model) {
		service.companyList(model); //����� model��
		return "admin/company/list";
	}
	@RequestMapping("companyDetail")
	public String companyDetail(String id, Model model) {
		Member_detailDTO companyDetail = service.companyDetail(id);
        model.addAttribute("companyDetail", companyDetail);
        return "admin/company/detailList";
	}
	@RequestMapping("allProduct")
	public String allProduct(Model model
			//, @RequestParam(value="pageNum", defaultValue = "1") int pageNum
			) {
		service.allProduct(model);
		return "admin/company/allProduct";
	}
	
	@RequestMapping("stockless")
	public String stockless(Model model, int stock) {
		service.stockless(model, stock);
		return "admin/company/stockless";
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
	public String companyStatusChange(String id, String status, String companyid, Model model) {
	    service.companyStatus(status, id);

	    //companyid��������
	    String companyId = service.getCompanyId(id);
	    
	    System.out.println("����" + id + "�� companyid : " + companyId);
	    
	    //���ο� companyid ����
	    String newCompanyId = service.generateCompanyId(companyid, id);
	    
	    System.out.println("���ο� CompanyId : " +newCompanyId);

	    //newCompanyid�� companyid�� �־��� 
	    model.addAttribute("companyid", newCompanyId);
	    
	    System.out.println("=====================");
	    System.out.println("���� companyId ===" + newCompanyId);

	    return "admin/company/statusChange";
	}

	
	@RequestMapping("checkStock")
	public @ResponseBody String checkStock(String product) {
		System.out.println(product);
		service.checkstock(product);
		return "stock check!!";
	}
	
	@RequestMapping("adminChat")
	public String adminChat() {
		return "admin/adminChat";
	}
	
	  
}
