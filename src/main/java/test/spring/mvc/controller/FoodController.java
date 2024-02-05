package test.spring.mvc.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.bean.ProductinfoDTO;
import test.spring.mvc.service.Admin1ServiceImpl;
import test.spring.mvc.service.Seller1Service;

@Controller
@RequestMapping("/member/*")
public class FoodController {
	
	@Autowired
	private Admin1ServiceImpl service;
	
	@Autowired
	private Seller1Service service1;
	
	@RequestMapping("food")
	public String food(Model model) {
		return "/member/food/food";
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
			model.addAttribute("kc", kcal);
			model.addAttribute(me +"_re", aa);
			model.addAttribute("list", lists);
			model.addAttribute("kcal", boundsList);
			System.out.println(me + "@@@@@@@@@@@@@@@@"+check);
			model.addAttribute(me+"_chk", check);
			System.out.println(me+"++++++++++++++++++++++++++++"+aa);
		}
		return "/member/food/eat";
	}
	
	@RequestMapping("detail")
    public @ResponseBody ProductDTO detail(String companyid, String category, String category2, String flavor,
                         Model model,Principal pri) {
    	System.out.println(companyid);
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
        product.setThumimg(thumbnailPaths);
        product.setImg(imagePaths);
        return product;
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
	
	@RequestMapping("addCartMore1")
	public @ResponseBody String addCartMore(Principal pri ,String products) {
		service.addCartMore(pri.getName(),products);
		return "hi";
	}

	@RequestMapping("Rdelivery")
	public String Rdelivery() {
		return "/member/Rdelivery";
	}
}
