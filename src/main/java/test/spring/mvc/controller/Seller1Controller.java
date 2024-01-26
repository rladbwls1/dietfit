package test.spring.mvc.controller;

import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.repository.Seller1Mapper;
import test.spring.mvc.service.Seller1Service;

@Controller
@RequestMapping("/seller/**")
public class Seller1Controller {
	@Autowired
    private Seller1Service service;
	
	@RequestMapping("/store/{companyid}")
	public String getProductsByCompanyId(@PathVariable("companyid") String companyid, Model model) {
	    List<ProductDTO> products = service.findallproductbycompanyid(companyid);
	    if (products != null) {
	        for (ProductDTO product : products) {
	            ProductimgDTO img = service.findlistthum(companyid,product.getCategory(), product.getCategory2());
	            if (img != null) {
	                // 이미지 경로 직접 조합하여 설정
	                String imagePath = "/resources/p_img/" + img.getCompanyid() +
	                                   img.getCategory() + img.getCategory2() +
	                                   img.getFlavor() + "F" + img.getNum() +
	                                   img.getExt();
	               product.setImagePath(imagePath);
	            }
	        }
	        model.addAttribute("products", products);
	    }
	    return "seller/productList";
	}
	
    // 상품 등록 페이지
	@RequestMapping("/store/productadd")
	public String productadd(@RequestParam("companyid") String companyid, Model model) {
	    model.addAttribute("companyid", companyid); 
	    return "seller/prodcutadd";
	}
	
	@RequestMapping("productaddPro")
	public String productAddPro(ProductDTO dto,
	                            ProductimgDTO img,
	                            @RequestParam("companyid") String companyid,
	                            @RequestParam("category") String category, 
	                            @RequestParam("category2") String category2,
	                            @RequestParam("flavor") String flavor, 
	                            @RequestParam("thumbnail") MultipartFile[] thumbnails,
	                            @RequestParam("attachments") MultipartFile[] attachments,
	                            HttpServletRequest request) {

	    // 제품 정보 저장
	    dto.setCompanyid(companyid);
	    img.setCompanyid(companyid);

	    List<MultipartFile> thumbnailList = thumbnails != null ? Arrays.asList(thumbnails) : new ArrayList<>();
	    List<MultipartFile> attachmentList = attachments != null ? Arrays.asList(attachments) : new ArrayList<>();

	    // 파일 개수 계산
	    int thumbnailCount = thumbnailList.size();
	    int attachmentCount = attachmentList.size();

	    // 파일 총 개수 저장
	    dto.setIsfile(thumbnailCount + attachmentCount);
	    
	    // attachmentList 확장자 추출 및 DB에 저장
	    for (MultipartFile attachment : attachmentList) {
	        String originalFilename = attachment.getOriginalFilename();
	        String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
	        
	        // 확장자 추출 후 DB에 저장 (여기에서는 예시로 thum 열에 0로 저장)
	        img.setExt(ext);
	        img.setThum(0);
	        service.insertProductimg(img, companyid);
	        service.fileUpload(companyid, img.getCategory(), img.getCategory2(), img.getFlavor(), attachment);
	        
	        }
	    
	    // thumbnail 확장자 추출 및 DB에 저장
	    for (MultipartFile thumbnail : thumbnailList) {
	        String originalFilename = thumbnail.getOriginalFilename();
	        String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
	        
	        // 확장자 추출 후 DB에 저장 (여기에서는 예시로 thum 열에 1로 저장)
	        img.setExt(ext);
	        img.setThum(1);
	        service.insertProductimg(img, companyid);
	        service.fileUpload(companyid, img.getCategory(), img.getCategory2(), img.getFlavor(), thumbnail);
	    }
	    
	    // img 객체에 필요한 필드를 설정
	    img.setCategory(category);
	    img.setCategory2(category2);
	    img.setFlavor(flavor);

	    
	    // 데이터베이스에 상품 저장
	    service.insertProduct(dto, companyid);
	    
	    return "redirect:seller/store/home";
	}


    @RequestMapping("/store/home")
    public String main() {
    	return "seller/home";
    }
	
    @GetMapping("/details/{companyid}/{category}/{category2}/{flavor}")
    public String detail(@PathVariable("companyid") String companyid,
                         @PathVariable("category") String category,
                         @PathVariable("category2") String category2,
                         @PathVariable("flavor") String flavor,
                         HttpServletRequest request,
                         HttpServletResponse response,
                         Model model,Principal pri,
                         String productUrl, String productImage) {
    	String id = pri.getName();
    	
        ProductDTO product = service.findproductdetail(companyid, category, category2, flavor);

        // 썸네일 이미지 정보를 가져옴
        List<ProductimgDTO> thumbnails = service.findthumimg(companyid, category, category2);

        // 대표 이미지 정보를 가져옴
        List<ProductimgDTO> images = service.findimg(companyid, category, category2);

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
        
        // 최근 본 상품 정보를 쿠키에 추가
        addRecentlyViewedProductToCookie(request, response, companyid + category + category2 + flavor, id, 
        		model, "/details/" + companyid + "/" + category + "/" + category2 + "/" + flavor, thumbnailPaths);

        return "seller/productdetail";
    }
    
    private void addRecentlyViewedProductToCookie(HttpServletRequest request, HttpServletResponse response, String productId, String id, Model model, String productUrl, List<String> thumbnailPaths) {
        String recentlyViewedProduct = getRecentlyViewedProductFromCookie(request, id);

     // 기존 쿠키 값이 없으면 새로 생성
        if (recentlyViewedProduct == null) {
            recentlyViewedProduct = productId;
        } else {
            String[] productArray = splitProducts(recentlyViewedProduct);

            // 중복 체크
            if (!containsProduct(productArray, productId)) {
                recentlyViewedProduct += "/" + productId;
            }
        }

        // 쿠키 값 "/" 기준으로 나누기
        String[] productArray = splitProducts(recentlyViewedProduct);

        // JSP에 전달하기 위해 배열을 문자열로 조합
        String joinedProducts = String.join("/", productArray);

        Cookie cookie = new Cookie("recentlyViewed_" + id, joinedProducts);
        model.addAttribute("recentlyViewedProducts", joinedProducts);
        cookie.setMaxAge(24 * 60 * 60); // 쿠키의 유효 시간 (초 단위), 여기서는 1일로 설정
        //cookie.setMaxAge(60); // 1분으로 설정
        cookie.setPath("/"); // 쿠키의 경로 설정
        response.addCookie(cookie);
    }

    private String[] splitProducts(String products) {
        if (products != null && !products.isEmpty()) {
            return products.split("/");
        }
        return new String[0];
    }
    private boolean containsProduct(String[] products, String productId) {
        for (String product : products) {
            if (product.equals(productId)) {
                return true;
            }
        }
        return false;
    }

    private String getRecentlyViewedProductFromCookie(HttpServletRequest request, String id) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (("recentlyViewed_" + id).equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }


    @RequestMapping("RecentViewProduct")
    public String recentViewProduct(Model model, Principal pri, HttpServletRequest request) {
        String id = pri.getName(); // 사용자 ID 얻어오기

        // 쿠키에서 최근 본 상품 정보를 읽어옴
        String recentlyViewedProduct = getRecentlyViewedProductFromCookie(request, id);

        // 최근 본 상품 정보를 리스트로 변환 (예시로 문자열로 표현)
        List<String> recentlyViewedProducts = Arrays.asList(recentlyViewedProduct.split("/"));
        service.getProductByCookie(recentlyViewedProducts,model);
        
        model.addAttribute("recentlyViewedProducts", recentlyViewedProducts);
        model.addAttribute("id", id);

        return "member/RecentViewProduct";
    }
    
    
    

	 @RequestMapping("/store/Delete")
	 public String deleteProduct(@RequestParam("companyid") String companyid,
	                             @RequestParam("category") String category,
	                             @RequestParam("category2") String category2,
	                             @RequestParam("flavor") String flavor,
	                             RedirectAttributes redirectAttributes) {
	         // 상품 및 관련 이미지 삭제
	         service.deleteProduct(companyid, category, category2, flavor);
	         service.deleteProductimg(companyid, category, category2, flavor);
	         service.fileDelete(companyid, category, category2, flavor);
	         redirectAttributes.addFlashAttribute("successMessage", "상품이 성공적으로 삭제되었습니다.");

	     return "redirect:/seller/store/home";
	 }
	 
	 @RequestMapping("/store/Update")
	 public String updateForm(Model model, 
	                          @RequestParam("companyid") String companyid, 
	                          @RequestParam("category") String category, 
	                          @RequestParam("category2") String category2, 
	                          @RequestParam("flavor") String flavor) {
	     // 상품 정보 조회
	     ProductDTO dto = service.findproductdetail(companyid, category, category2, flavor);
	     List<ProductimgDTO> imgList = service.imgfindupdate(companyid, category, category2, flavor);

	     // 모델에 상품 정보와 이미지 목록 추가
	     model.addAttribute("product", dto);
	     model.addAttribute("images", imgList);

	     return "seller/updatefrom";
	 }

	 @RequestMapping("UpdatePro")
	 public String UpdatePro(@ModelAttribute("productDTO") ProductDTO productDTO, 
	                         Model model) {
	     service.updateProduct(productDTO);
	     return "redirect:/seller/store/home";
	 }
}