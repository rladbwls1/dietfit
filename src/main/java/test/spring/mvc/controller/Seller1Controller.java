package test.spring.mvc.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
                         Model model) {
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

        return "seller/productdetail";
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