package test.spring.mvc.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.remoting.httpinvoker.SimpleHttpInvokerServiceExporter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
import test.spring.mvc.service.Seller1Service;

@Controller
@RequestMapping("/admin/*")
public class Admin1Controller {

	@Autowired
	private Admin1ServiceImpl service;
	
	@Autowired
	private Seller1Service service1;
	
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
	public String foodPro(int kcal, Model model, HttpServletRequest request) {
		List<ProductinfoDTO> lists = new ArrayList<>();
		double [][] oper = {{0.23, 0.25}, {0.33, 0.35}, {0.28, 0.3}, {0.12, 0.15}};
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

			List<ProductinfoDTO> food = service.food((int)(oper[i][0] * kcal), (int)(oper[i][1] * kcal), model, category, request);
			lists.addAll(food);
			List<ProductDTO> re = new ArrayList<>();
			List<ProductDTO> aa = new ArrayList<>();
			List<ProductDTO> selectedPair = new ArrayList<>();
			List<List<ProductDTO>> groupedList = new ArrayList<>();
			List<ProductDTO> pair = new ArrayList<>();
			int check = (int) request.getAttribute("check");
			System.out.println("check " + check);
			for(ProductinfoDTO f: food) {
			   result = service.food_product(f.getProductid());
			   re.addAll(result);
			}
			if(check == 0) {
			if (!re.isEmpty()) { // 결과가 비어 있지 않을 때만 랜덤 선택 수행
                int index = new Random().nextInt(re.size());
                System.out.println("Random Index: " + index);
                ProductDTO pi = re.get(index);
                aa.add(pi);
            }
			}else {
//            	List<String> ccList = new ArrayList<>();
//            	ccList.add("cc");
				Collections.shuffle(re);
				List<List<ProductDTO>> restOfGroupedList = new ArrayList<>();

            	for (int j = 0; j < re.size(); j += 2) {
            	    pair = new ArrayList<>();
            	    pair.add(re.get(j));
            	    if (j + 1 < re.size()) {
            	        pair.add(re.get(j + 1));
            	    }
            	    groupedList.add(pair);
            	    selectedPair = groupedList.get(0);
            	    System.out.println("222222222222222222222" + selectedPair);
            	}
            	
            	for (int j = 1; j < groupedList.size(); j++) {
                    restOfGroupedList.add(groupedList.get(j));
                }

            	request.setAttribute("rest", restOfGroupedList);
            	model.addAttribute(me+"_rest", restOfGroupedList);
            	System.out.println(me+"~~~~~~~~~~"+restOfGroupedList);
            	System.out.println(request.getAttribute("rest"));
            }
			model.addAttribute(me + "_check", check);
			model.addAttribute(me + "_minkcal", (int)(oper[i][0] * kcal));
			model.addAttribute(me + "_maxkcal", (int)(oper[i][1] * kcal));
			model.addAttribute(me +"_re", aa);
			model.addAttribute("list", lists);
			model.addAttribute(me + "_group", selectedPair);
			model.addAttribute("kcal", boundsList);
		}
		return "admin/foodPro";
	}
	
	@RequestMapping("change")
	public @ResponseBody List<ProductDTO> change(String mo, int minkcal, int maxkcal, Model model, int type, HttpServletRequest request) {
		List<Integer> category = null;
		category = Arrays.asList(31, 32, 33, 34, 35, 36, 39, 41, 42, 43, 44);
		if(type == 1) {
			category = Arrays.asList(11, 12, 13, 14, 15, 21, 22, 23, 24, 26);
		}
		List<ProductinfoDTO> food = service.food(minkcal, maxkcal, model, category, request);
		List<ProductDTO> re = new ArrayList<>();
		List<ProductDTO> aa = new ArrayList<>();
		List<ProductDTO> result = new ArrayList<>();
		for(ProductinfoDTO f: food) {
		   result = service.food_product(f.getProductid());
		   for (ProductDTO product : result) {
	            if (!mo.equals(product.getProductinfo().getProductid())) {
	                re.add(product);
	            }
	        }
		}
//		Collections.shuffle(re);
		
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
	
	@RequestMapping("change2")
	public @ResponseBody List<ProductDTO> change2(String type, HttpServletRequest request) {
		List<ProductDTO> restOfGroupedList = new ArrayList<>();
		if(type.equals("mo")) {
			System.out.println("555555555555555555555555555555");
			System.out.println(); 
			System.out.println("555555555555555555555555555555"+ restOfGroupedList);
		}
//		List<Integer> category = null;
//		category = Arrays.asList(31, 32, 33, 34, 35, 36, 39, 41, 42, 43, 44);
//		if(type == 1) {
//			category = Arrays.asList(11, 12, 13, 14, 15, 21, 22, 23, 24, 26);
//		}
//		List<ProductinfoDTO> food = service.food(minkcal, maxkcal, model, category, request);
//		List<ProductDTO> re = new ArrayList<>();
//		List<ProductDTO> aa = new ArrayList<>();
//		List<ProductDTO> result = new ArrayList<>();
//		for(ProductinfoDTO f: food) {
//		   result = service.food_product(f.getProductid());
//		   for (ProductDTO product : result) {
//	            if (!mo.equals(product.getProductinfo().getProductid())) {
//	                re.add(product);
//	            }
//	        }
//		}
//		Collections.shuffle(re);
		return restOfGroupedList;
	}
	
	@RequestMapping("eat")
	public String eat(int kcal, Model model, HttpServletRequest request) {
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

			List<ProductinfoDTO> food = service.food((int)(oper[i][0] * kcal), (int)(oper[i][1] * kcal), model, category, request);
			lists.addAll(food);
			List<ProductDTO> re = new ArrayList<>();
			List<ProductDTO> aa = new ArrayList<>();
			int check = (int) request.getAttribute("check");
			for(ProductinfoDTO f: food) {
			   result = service.food_product(f.getProductid());
			   re.addAll(result);
			}
			System.out.println("0000000000000000000000000"+re);
			if (!re.isEmpty()) { // 결과가 비어 있지 않을 때만 랜덤 선택 수행
				Collections.shuffle(re);
				ProductDTO pi = re.get(0);
				aa.add(pi);
				if(re.size() >= 2 && check == 1) {
					pi = re.get(1);
					aa.add(pi);
				}
            }
			model.addAttribute(me + "_minkcal", (int)(oper[i][0] * kcal));
			model.addAttribute(me + "_maxkcal", (int)(oper[i][1] * kcal));
			model.addAttribute(me +"_re", aa);
			model.addAttribute("list", lists);
			model.addAttribute("kcal", boundsList);
			System.out.println(me + "@@@@@@@@@@@@@@@@"+check);
			model.addAttribute(me+"_chk", check);
			System.out.println(me+"++++++++++++++++++++++++++++"+aa);
		}
		return "admin/eat";
	}
	
	@RequestMapping("main")
	public String admin_main() {
		return "/admin/admin_main";
	}
	
	@GetMapping("/detail/{companyid}/{category}/{category2}/{flavor}")
    public String detail(@PathVariable("companyid") String companyid,
                         @PathVariable("category") String category,
                         @PathVariable("category2") String category2,
                         @PathVariable("flavor") String flavor,
                         HttpServletRequest request,
                         HttpServletResponse response,
                         Model model,Principal pri,
                         String productUrl, String productImage) {
    	String id = pri.getName();
    	
        ProductDTO product = service1.findproductdetail(companyid, category, category2, flavor);

        // 썸네일 이미지 정보를 가져옴
        List<ProductimgDTO> thumbnails = service1.findthumimg(companyid, category, category2);

        // 대표 이미지 정보를 가져옴
        List<ProductimgDTO> images = service1.findimg(companyid, category, category2);

        List<String> thumbnailPaths = new ArrayList<>();
        List<String> imagePaths = new ArrayList<>();

        // 썸네일 이미지 경로들을 생성
        for (ProductimgDTO thumbnail : thumbnails) {
            String path = "/resources/p_img/" + thumbnail.getCompanyid() +
                          thumbnail.getCategory() + thumbnail.getCategory2() +
                          thumbnail.getFlavor() + "F" + thumbnail.getNum() +
                          thumbnail.getExt();
            thumbnailPaths.add(path);
        }

        // 대표 이미지 경로들을 생성
        for (ProductimgDTO image : images) {
            String path = "/resources/p_img/" + image.getCompanyid() +
                          image.getCategory() + image.getCategory2() +
                          image.getFlavor() + "F" + image.getNum() +
                          image.getExt();
            imagePaths.add(path);
        }

        // 모델에 추가
        model.addAttribute("product", product);
        model.addAttribute("thumbnailPaths", thumbnailPaths);
        model.addAttribute("imagePaths", imagePaths);
        model.addAttribute("id", id);
        

        return "/admin/detail";
    }
	
}