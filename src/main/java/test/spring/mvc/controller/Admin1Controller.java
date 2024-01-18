package test.spring.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
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
	
	@RequestMapping("NicCheck")
	public @ResponseBody String NicCheck(String id, String nic) {
		int check = service.NicCheck(nic);
		String result = "0";
		if(check == 1) {
			result = "1";
		}
		return result;
	}
	
	@RequestMapping("best")
	public String best(Model model) {
		List<ProductDTO> dto = service.best();
		if(dto != null) {
			for(ProductDTO pd : dto) {
				ProductimgDTO img = service.pro_img(pd.getCompanyid(), pd.getCategory(), pd.getCategory2());
				if (img != null) {
	                String imagePath = "/resources/p_img/" + img.getCompanyid() +
	                                   img.getCategory() + img.getCategory2() +
	                                   img.getFlavor() + "F" + img.getNum() +
	                                   img.getExt();
	               pd.setImagePath(imagePath);
	            }
			}
		}
		model.addAttribute("best", dto);
		return "admin/best";
	}
	
	@RequestMapping("allcoupon")
	public String allcoupon(Model model, @RequestParam(value="pageNum", defaultValue="1") int pageNum) {
		service.allcoupon(pageNum, model);
		int alram = service.alram();
		model.addAttribute("alram", alram);
		return "admin/allcoupon";
	}
	
	@RequestMapping("adminCheck")
	public @ResponseBody Map<String, Object> adminCheck(String couponId) {
		Map<String, Object> chk = new HashMap<>();
		int check = service.adminCheck(couponId);
		int alram = service.alram();
		if(check == 1) {
			chk.put("result", check);
			chk.put("msg", alram);
		}else {
			chk.put("result", check);
			chk.put("msg", 0);
		}
		return chk;
	}
	@RequestMapping("adminCheck2")
	public @ResponseBody String adminCheck2(String couponId) {
		int check = service.adminCheck2(couponId);
		int alram = service.alram();
		String result = "0";
		if(check == 1) {
			result = "1";
		}
		return result;
	}
	
	@RequestMapping("coupon")
	public String coupon(String id, Model model) {
		Member_basicDTO dto = service.info(id);
		List<AllcouponDTO> list = service.coupon(id);
		model.addAttribute("info", dto);
		model.addAttribute("coupon", list);
		return "/admin/coupon";
	}
	@RequestMapping("best2")
	public String best2(Model model) {
		List<ProductDTO> dto = service.best2();
		if(dto != null) {
			for(ProductDTO pd : dto) {
				ProductimgDTO img = service.pro_img(pd.getCompanyid(), pd.getCategory(), pd.getCategory2());
				if (img != null) {
	                String imagePath = "/resources/p_img/" + img.getCompanyid() +
	                                   img.getCategory() + img.getCategory2() +
	                                   img.getFlavor() + "F" + img.getNum() +
	                                   img.getExt();
	               pd.setImagePath(imagePath);
	            }
			}
		}
		model.addAttribute("best", dto);
		return "/admin/best2";
	}
	
	@RequestMapping("discount")
	public String discount(Model model) {
		List<ProductDTO> dto = service.discount();
		if(dto != null) {
			for(ProductDTO pd : dto) {
				ProductimgDTO img = service.pro_img(pd.getCompanyid(), pd.getCategory(), pd.getCategory2());
				int sale = service.sale(pd.getNum());
				if (img != null) {
	                String imagePath = "/resources/p_img/" + img.getCompanyid() +
	                                   img.getCategory() + img.getCategory2() +
	                                   img.getFlavor() + "F" + img.getNum() +
	                                   img.getExt();
	               pd.setImagePath(imagePath);
	               pd.setSale(sale);
	            }
			}
		}
		model.addAttribute("discount", dto);
		return "/admin/discount";
	}
	
	@RequestMapping("product")
	public String product(Model model) {
		List<ProductDTO> dto = service.reco();
		if(dto != null) {
			for(ProductDTO pd : dto) {
				ProductimgDTO img = service.pro_img(pd.getCompanyid(), pd.getCategory(), pd.getCategory2());
				if (img != null) {
	                String imagePath = "/resources/p_img/" + img.getCompanyid() +
	                                   img.getCategory() + img.getCategory2() +
	                                   img.getFlavor() + "F" + img.getNum() +
	                                   img.getExt();
	               pd.setImagePath(imagePath);
	            }
			}
		}
		model.addAttribute("reco", dto);
		return "admin/product";
	}
	
	@RequestMapping("food")
	public String food() {
		return "/admin/food";
	}
}

