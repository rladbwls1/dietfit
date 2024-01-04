package test.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.service.Admin1ServiceImpl;

@Controller
@RequestMapping("/admin/*")
public class Admin1Controller {

	@Autowired
	private Admin1ServiceImpl service;
	
	@RequestMapping("mList")
	public String memberList(Model model, @RequestParam(value="pageNum", defaultValue="1") int pageNum) {
		service.MemberList(pageNum, model);
		return "admin/mList";
	}
	
	@RequestMapping("management")
	public String management(String id, Model model) {
		Member_basicDTO dto = service.info(id);
		Member_detailDTO dto2 = service.mem_info(id);
		model.addAttribute("info", dto);
		model.addAttribute("mem_info", dto2);
		return "admin/management";
	}
	
	@RequestMapping("modifyinfo")
	public String modifyinfo(String id, Model model) {
		Member_basicDTO dto = service.info(id);
		Member_detailDTO dto2 = service.mem_info(id);
		model.addAttribute("info", dto);
		model.addAttribute("mem_info", dto2);
		return "admin/modifyinfo";
	}

	@RequestMapping("modify")
	public String modify(String id, Model model, Member_detailDTO dto, Member_basicDTO mb) {
		int result = service.up_mem_info(dto, mb);
		model.addAttribute("check", result);
		model.addAttribute("id", id);
		return "admin/modify";
	}
	
	@DeleteMapping("idCheck")
	public @ResponseBody String NicCheck(String nic) {
		String result = "success";
			result = "fail";
		return result;
	}
}
