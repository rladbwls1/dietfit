package test.spring.mvc.controller;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.repository.Seller1Mapper;
import test.spring.mvc.repository.SellerMapper;
import test.spring.mvc.service.Seller1Service;
import test.spring.mvc.service.SellerService;

@Controller
@RequestMapping("/seller/**")
public class Seller1Controller {
	@Autowired
    private Seller1Service service;
	@Autowired
	private Seller1Mapper mapper;
	
	@RequestMapping("store")
	public String getProductsByCompanyId(@RequestParam("companyid") String companyid, Model model) {
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
	    model.addAttribute("companyid", companyid); 
	    return "seller/productList";
	}
	
    // 상품 등록 페이지
	@RequestMapping("productadd")
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
	                            HttpServletRequest request,
	                            Model model) {
	    
	    String path = request.getServletContext().getRealPath("/resources/p_img/");
	    
	    // 제품 정보 설정
	    dto.setCompanyid(companyid);
	    img.setCompanyid(companyid);
	    img.setCategory(category);
	    img.setCategory2(category2);
	    img.setFlavor(flavor);

	    // 파일 총 개수 저장
	    int thumbnailCount = (thumbnails != null) ? thumbnails.length : 0;
	    int attachmentCount = (attachments != null) ? attachments.length : 0;
	    dto.setIsfile(thumbnailCount + attachmentCount);

	    // attachment 파일 처리
        for (MultipartFile attachment : attachments) {
            String originalFilename = attachment.getOriginalFilename();
            String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
            if (ext == null) ext = "";

            // 확장자와 기타 정보를 DB에 저장
            img.setExt(ext);
            img.setThum(0);
            service.insertProductimg(img, companyid);

            // 파일 업로드
            service.fileUpload(companyid, img.getCategory(), img.getCategory2(), img.getFlavor(), attachment, path);
        }

	    // thumbnail 파일 처리
        for (MultipartFile thumbnail : thumbnails) {
            String originalFilename = thumbnail.getOriginalFilename();
            String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
            if (ext == null) ext = "";

            // 확장자와 기타 정보를 DB에 저장
            img.setExt(ext);
            img.setThum(1);
            service.insertProductimg(img, companyid);

            // 파일 업로드
            service.fileUpload(companyid, img.getCategory(), img.getCategory2(), img.getFlavor(), thumbnail, path);
        }

	    // 데이터베이스에 상품 저장
	    service.insertProduct(dto, companyid);
	    model.addAttribute("companyid", companyid);
	    return "redirect:/seller/store";
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
	                             RedirectAttributes redirectAttributes,
	                             Model model,
	                             HttpServletRequest request) {
 		 System.out.println(companyid);
	 	 String path = request.getServletContext().getRealPath("/resources/p_img/");
         // 상품 및 관련 이미지 삭제
         service.deleteProduct(companyid, category, category2, flavor);
         service.deleteProductimg(companyid, category, category2, flavor);
         service.fileDelete(companyid, category, category2, flavor,path);
         redirectAttributes.addFlashAttribute("상품이 성공적으로 삭제되었습니다.");
         model.addAttribute("companyid", companyid);
	     return "redirect:/seller/store?companyid="+companyid;
	 }
	 
	 @RequestMapping("/store/Update")
	 public String updateForm(Model model, 
	                          @RequestParam("companyid") String companyid, 
	                          @RequestParam("category") String category, 
	                          @RequestParam("category2") String category2, 
	                          @RequestParam("flavor") String flavor,
	                          HttpServletRequest request) {
	     // 상품 정보 조회
	     ProductDTO product = service.findproductdetail(companyid, category, category2, flavor);
	     // 상품 이미지 조회
	     List<ProductimgDTO> imgList = service.updateimg(companyid, category, category2, flavor);
	     List<ProductimgDTO> thumimgList = service.updatethumimg(companyid, category, category2, flavor);
	     
	     model.addAttribute("companyid", companyid);
	     model.addAttribute("category", category);
	     model.addAttribute("category2", category2);
	     model.addAttribute("flavor", flavor);
	     model.addAttribute("product", product);
	     model.addAttribute("images", imgList);
	     model.addAttribute("thumimages", thumimgList);
	     return "seller/updatefrom";
	 }

	 @RequestMapping("UpdatePro")
	 public String UpdatePro(ProductDTO productDTO,
			 				 ProductimgDTO img,
	                         @RequestParam("companyid") String companyid,
	                         @RequestParam("category") String category, 
	                         @RequestParam("category2") String category2,
	                         @RequestParam("flavor") String flavor, 
	                         @RequestParam(value="thumfileName",required = false) List<String> thumfileNames,
	                         @RequestParam(value="thumnum",required = false) List<Integer> thumnums,
	                         @RequestParam(value="imgfileName",required = false) List<String> imgfileNames,
	                         @RequestParam(value="imgnum",required = false) List<Integer> imgnums,
	                         @RequestParam(value="thumbnail",required = false) MultipartFile[] thumbnails,
	                         @RequestParam(value="attachments",required = false) MultipartFile[] attachments,
	                         HttpServletRequest request,
	                         Model model) {
		 
	     String path = request.getServletContext().getRealPath("/resources/p_img/");
        //companyid, category, category2, flavor 수정되면
        ProductDTO pdto=mapper.getProductCodeByNum(productDTO.getNum());
        
        if(pdto.getCompanyid()!=productDTO.getCompanyid()||pdto.getCategory()!=productDTO.getCategory()||
        		pdto.getCategory2()!=productDTO.getCategory2()||pdto.getFlavor()!=productDTO.getFlavor()) {
        	//기존 productimg DB 
        	//기존 썸네일
        	for(String thumname:thumfileNames) {
        		String ext = thumname.substring(thumname.lastIndexOf(".")); 
        		img.setExt(ext);
    	    	img.setThum(1);
        		//DB추가
        		service.insertProductimg(img, companyid);
        		String newfilename = companyid + category + category2 + flavor + "F" + mapper.selectMaxProductSeq(companyid) + ext;
        		File saveFile = new File(path, thumname);
        		File newFile = new File(path, newfilename);
        		//새로 저장할 파일
	    		try {
	    			//파일 이름 변경
	    			 saveFile.renameTo(newFile);
    			}catch (Exception e) {
	    				e.printStackTrace();
    			}
	    		//기존거 DB삭제 
	    		service.deleteProductimgnum(thumnums);
        	}
        	//기존 상품설명이미지
        	for(String imgname:imgfileNames) {
        		String ext = imgname.substring(imgname.lastIndexOf(".")); 
        		img.setExt(ext);
    	    	img.setThum(0);
        		//DB추가
        		service.insertProductimg(img, companyid);
        		String newfilename = companyid + category + category2 + flavor + "F" + mapper.selectMaxProductSeq(companyid) + ext;
        		File saveFile = new File(path, imgname);
        		File newFile = new File(path, newfilename);
        		//새로 저장할 파일
	    		try {
	    			//파일 이름 변경
	    			 saveFile.renameTo(newFile);
    			}catch (Exception e) {
	    				e.printStackTrace();
    			}
	    		service.deleteProductthumimg(imgnums);
        	}
        }
	    service.updateProduct(productDTO);  // 전체 수정
	    
	    model.addAttribute("companyid", companyid);
	    return "redirect:/seller/store";
	 }
	 
	 
	 @RequestMapping("thumbnailUpdate")
	 public String thumbnailUpdate(Model model, 
			 @RequestParam("num") int num,
			 @RequestParam("isfile") int isfile,
             @RequestParam("companyid") String companyid, 
             @RequestParam("category") String category, 
             @RequestParam("category2") String category2, 
             @RequestParam("flavor") String flavor,
             HttpServletRequest request) {
		 
		 List<ProductimgDTO> thumimgList = service.updatethumimg(companyid, category, category2, flavor);
		 model.addAttribute("num", num);
		 model.addAttribute("isfile", isfile);
		 model.addAttribute("companyid", companyid);
	     model.addAttribute("category", category);
	     model.addAttribute("category2", category2);
	     model.addAttribute("flavor", flavor);
		 model.addAttribute("thumimages", thumimgList);
		 return "/seller/thumbnailUpdate";
	 }
	 
	 @RequestMapping("thumbnailUpdatePro")
	 public String thumbnailUpdatePro(Model model, ProductimgDTO dto , HttpServletRequest request, MultipartFile[] thumbnails) {
		 String path = request.getServletContext().getRealPath("/resources/p_img/");
		 int isfile=0;
		 for (MultipartFile thumbnail : thumbnails) {
			 String originalFilename = thumbnail.getOriginalFilename();
	            String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
	            if (ext == null) ext = "";

	            // 확장자와 기타 정보를 DB에 저장
	            dto.setExt(ext);
	            dto.setThum(1);
	            service.insertProductimg(dto, dto.getCompanyid());

	            // 파일 업로드
	            service.fileUpload(dto.getCompanyid(), dto.getCategory(), dto.getCategory2(), dto.getFlavor(), thumbnail, path);
	            isfile++;
		 }
		 dto.setIsfile(dto.getIsfile()+isfile);
		    // 데이터베이스에 상품 isfile
		 service.updateProductIsfile(dto);
		 model.addAttribute("companyid", dto.getCompanyid());
	     model.addAttribute("category", dto.getCategory());
	     model.addAttribute("category2", dto.getCategory2());
	     model.addAttribute("flavor", dto.getFlavor());
		 return "redirect:/seller/store/Update";
	 }
	 
	 
	 @RequestMapping("thumbnailDelete")
	 public @ResponseBody String thumbnailDelete(int imgNum , int num,String fileName,HttpServletRequest request) {
		 service.thumbnailDelete(imgNum);
		 service.productIsfileDelete(num);
		 String path = request.getServletContext().getRealPath("/resources/p_img/");
		 File file = new File(path, fileName);
	     if (file.exists()) {
	    	 file.delete();
	     }
		 return "ok";
	 }
	 
	 
	 @RequestMapping("productImageUpdate")
	 public String productImageUpdate(Model model, 
			 @RequestParam("num") int num,
			 @RequestParam("isfile") int isfile,
             @RequestParam("companyid") String companyid, 
             @RequestParam("category") String category, 
             @RequestParam("category2") String category2, 
             @RequestParam("flavor") String flavor,
             HttpServletRequest request) {
		 
		 List<ProductimgDTO> imgList = service.updateimg(companyid, category, category2, flavor);
		 model.addAttribute("num", num);
		 model.addAttribute("isfile", isfile);
		 model.addAttribute("companyid", companyid);
	     model.addAttribute("category", category);
	     model.addAttribute("category2", category2);
	     model.addAttribute("flavor", flavor);
		 model.addAttribute("images", imgList);
	     
		 return "/seller/productImageUpdate";
	 }
	 
	 @RequestMapping("productImageUpdatePro")
	 public String productImageUpdatePro(Model model, ProductimgDTO dto , HttpServletRequest request, MultipartFile[] attachments) {
		 String path = request.getServletContext().getRealPath("/resources/p_img/");
		 int isfile=0;
		 // 새로운 파일 업로드 + DB 저장
		 for (MultipartFile attachment : attachments) {
			 String originalFilename = attachment.getOriginalFilename();
	            String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
	            if (ext == null) ext = "";

	            // 확장자와 기타 정보를 DB에 저장
	            dto.setExt(ext);
	            dto.setThum(0);
	            service.insertProductimg(dto, dto.getCompanyid());

	            // 파일 업로드
	            service.fileUpload(dto.getCompanyid(), dto.getCategory(), dto.getCategory2(), dto.getFlavor(), attachment, path);
	            isfile++;
		 }
		 dto.setIsfile(dto.getIsfile()+isfile);
		 
		 // 데이터베이스에 상품 isfile
		 service.updateProductIsfile(dto);
		 model.addAttribute("companyid", dto.getCompanyid());
	     model.addAttribute("category", dto.getCategory());
	     model.addAttribute("category2", dto.getCategory2());
	     model.addAttribute("flavor", dto.getFlavor());
		 return "redirect:/seller/store/Update";
	 }
	 
	 @RequestMapping("productImageDelete")
	 public @ResponseBody String productImageDelete(int imgNum , int num,String fileName,HttpServletRequest request) {
		 service.thumbnailDelete(imgNum);
		 service.productIsfileDelete(num);
		 String path = request.getServletContext().getRealPath("/resources/p_img/");
		 File file = new File(path, fileName);
	     if (file.exists()) {
	    	 file.delete();
	     }
		 return "ok";
	 }
	 
}




















