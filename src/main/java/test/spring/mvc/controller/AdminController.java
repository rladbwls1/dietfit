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
	@RequestMapping("allProduct")
	public String allProduct(Model model) {
		service.allProduct(model);
		return "admin/company/allProduct";
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
	
	@RequestMapping("/checkStock")
	@ResponseBody
	public String checkStock() {
		try {
	        // 서비스를 통해 stock이 20개 미만인 상품을 찾아서 이메일 보내기
	        service.checkStock();
	        return "이메일 전송 완료";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "이메일 전송 실패: " + e.getMessage();
	    }
	}
	
//	@RequestMapping(value = "sendMail", method = RequestMethod.GET)
//	public void sendMail(
//	        @RequestParam(name = "companyid") String companyid,
//	        @RequestParam(name = "category") String category,
//	        @RequestParam(name = "category2") String category2,
//	        @RequestParam(name = "flavor") String flavor,
//	        HttpServletRequest request, HttpServletResponse response) throws Exception {
//	    request.setCharacterEncoding("utf-8");
//	    response.setContentType("text/html;charset=utf-8");
//	    PrintWriter out = response.getWriter();
//	    eservice.sendMail(companyid, category, category2, flavor);
//	    out.print("메일 전송 완료");
//	}


}
