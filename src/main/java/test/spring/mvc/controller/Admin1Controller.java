package test.spring.mvc.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.remoting.httpinvoker.SimpleHttpInvokerServiceExporter;
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
import test.spring.mvc.bean.ProductinfoDTO;
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
	public String food(Model model) {
		
		return "/admin/food";
	}
	
	@RequestMapping("foodPro")
	public String foodPro(int kcal, Model model) {
		List<ProductinfoDTO> lists = new ArrayList<>();
		double [][] oper = {{0.2, 0.25}, {0.3, 0.35}, {0.25, 0.3}, {0.1, 0.15}};
		String [] menu = {"mo","br","de","se"};
		lists = new ArrayList<>();
		List<ProductDTO> result = new ArrayList<>();
		List<int[]> boundsList = new ArrayList<>();
		Random random = new Random();
		List<Integer> category = null;
// 간식		, {0.1, 0.15}
		for(int i = 0; i < oper.length; i++) {
			category = Arrays.asList(31, 32, 33, 34, 35, 36, 39, 41, 42, 43, 44);
			if(i < 3) {
				category = Arrays.asList(11, 12, 13, 14, 15, 21, 22, 23, 24, 26);
				System.out.println("11111111111111111");
			}
			System.out.println(menu[i]);
			String me = menu[i];
			System.out.println((int)(oper[i][0] * kcal));
			System.out.println((int)(oper[i][1] * kcal));

			List<ProductinfoDTO> food = service.food((int)(oper[i][0] * kcal), (int)(oper[i][1] * kcal), model, category);
			lists.addAll(food);
			List<ProductDTO> re = new ArrayList<>();
			List<ProductDTO> aa = new ArrayList<>();
			for(ProductinfoDTO f: food) {
			   result = service.food_product(f.getProductid());
			   re.addAll(result);
			}
			if (!re.isEmpty()) { // 결과가 비어 있지 않을 때만 랜덤 선택 수행
                int index = new Random().nextInt(re.size());
                System.out.println("Random Index: " + index);
                ProductDTO pi = re.get(index);
                aa.add(pi);
            }
			model.addAttribute(me + "_minkcal", (int)(oper[i][0] * kcal));
			model.addAttribute(me + "_maxkcal", (int)(oper[i][1] * kcal));
			model.addAttribute(me +"_re", aa);
			model.addAttribute("list", lists);
			model.addAttribute("kcal", boundsList);
		}
		return "admin/foodPro";
	}
	
	@RequestMapping("change")
	public @ResponseBody List<ProductDTO> change(String mo, int minkcal, int maxkcal, Model model, int type) {
		List<Integer> category = null;
		category = Arrays.asList(31, 32, 33, 34, 35, 36, 39, 41, 42, 43, 44);
		if(type == 1) {
			category = Arrays.asList(11, 12, 13, 14, 15, 21, 22, 23, 24, 26);
		}
		List<ProductinfoDTO> food = service.food(minkcal, maxkcal, model, category);
		List<ProductDTO> re = new ArrayList<>();
		List<ProductDTO> aa = new ArrayList<>();
		List<ProductDTO> result = new ArrayList<>();
		Random random = new Random();
		for(ProductinfoDTO f: food) {
		   result = service.food_product(f.getProductid());
		   for (ProductDTO product : result) {
	            if (!mo.equals(product.getProductinfo().getProductid())) {
	                re.add(product);
	            }
	        }
		}
		
//		if (!re.isEmpty()) { // 결과가 비어 있지 않을 때만 랜덤 선택 수행
//		    int index = new Random().nextInt(re.size());
//		    ProductDTO pi = re.get(index);
//		    ProductinfoDTO productinfo = pi.getProductinfo();
//		    
//		    if (productinfo != null) {
//		        String productId = productinfo.getProductid();
//		        if (!productId.equals(mo)) {
//		            aa.add(pi);
//		        }
//		    }
//		}
		return re;
	}
}