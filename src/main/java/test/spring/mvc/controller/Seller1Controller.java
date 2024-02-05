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
	                // �̹��� ��� ���� �����Ͽ� ����
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
	
    // ��ǰ ��� ������
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
	    
	    // ��ǰ ���� ����
	    dto.setCompanyid(companyid);
	    img.setCompanyid(companyid);
	    img.setCategory(category);
	    img.setCategory2(category2);
	    img.setFlavor(flavor);

	    // ���� �� ���� ����
	    int thumbnailCount = (thumbnails != null) ? thumbnails.length : 0;
	    int attachmentCount = (attachments != null) ? attachments.length : 0;
	    dto.setIsfile(thumbnailCount + attachmentCount);

	    // attachment ���� ó��
        for (MultipartFile attachment : attachments) {
            String originalFilename = attachment.getOriginalFilename();
            String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
            if (ext == null) ext = "";

            // Ȯ���ڿ� ��Ÿ ������ DB�� ����
            img.setExt(ext);
            img.setThum(0);
            service.insertProductimg(img, companyid);

            // ���� ���ε�
            service.fileUpload(companyid, img.getCategory(), img.getCategory2(), img.getFlavor(), attachment, path);
        }

	    // thumbnail ���� ó��
        for (MultipartFile thumbnail : thumbnails) {
            String originalFilename = thumbnail.getOriginalFilename();
            String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
            if (ext == null) ext = "";

            // Ȯ���ڿ� ��Ÿ ������ DB�� ����
            img.setExt(ext);
            img.setThum(1);
            service.insertProductimg(img, companyid);

            // ���� ���ε�
            service.fileUpload(companyid, img.getCategory(), img.getCategory2(), img.getFlavor(), thumbnail, path);
        }

	    // �����ͺ��̽��� ��ǰ ����
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

        // ����� �̹��� ������ ������
        List<ProductimgDTO> thumbnails = service.findthumimg(companyid, category, category2);

        // ��ǥ �̹��� ������ ������
        List<ProductimgDTO> images = service.findimg(companyid, category, category2);

        List<String> thumbnailPaths = new ArrayList<>();
        List<String> imagePaths = new ArrayList<>();

        // ����� �̹��� ��ε��� ����
        for (ProductimgDTO thumbnail : thumbnails) {
            String path = "/resources/p_img/" + thumbnail.getCompanyid() +
                          thumbnail.getCategory() + thumbnail.getCategory2() +
                          thumbnail.getFlavor() + "F" + thumbnail.getNum() +
                          thumbnail.getExt();
            thumbnailPaths.add(path);
        }

        // ��ǥ �̹��� ��ε��� ����
        for (ProductimgDTO image : images) {
            String path = "/resources/p_img/" + image.getCompanyid() +
                          image.getCategory() + image.getCategory2() +
                          image.getFlavor() + "F" + image.getNum() +
                          image.getExt();
            imagePaths.add(path);
        }

        // �𵨿� �߰�
        model.addAttribute("product", product);
        model.addAttribute("thumbnailPaths", thumbnailPaths);
        model.addAttribute("imagePaths", imagePaths);
        model.addAttribute("id", id);
        
        // �ֱ� �� ��ǰ ������ ��Ű�� �߰�
        addRecentlyViewedProductToCookie(request, response, companyid + category + category2 + flavor, id, 
        		model, "/details/" + companyid + "/" + category + "/" + category2 + "/" + flavor, thumbnailPaths);

        return "seller/productdetail";
    }
    
    private void addRecentlyViewedProductToCookie(HttpServletRequest request, HttpServletResponse response, String productId, String id, Model model, String productUrl, List<String> thumbnailPaths) {
        String recentlyViewedProduct = getRecentlyViewedProductFromCookie(request, id);

     // ���� ��Ű ���� ������ ���� ����
        if (recentlyViewedProduct == null) {
            recentlyViewedProduct = productId;
        } else {
            String[] productArray = splitProducts(recentlyViewedProduct);

            // �ߺ� üũ
            if (!containsProduct(productArray, productId)) {
                recentlyViewedProduct += "/" + productId;
            }
        }

        // ��Ű �� "/" �������� ������
        String[] productArray = splitProducts(recentlyViewedProduct);

        // JSP�� �����ϱ� ���� �迭�� ���ڿ��� ����
        String joinedProducts = String.join("/", productArray);

        Cookie cookie = new Cookie("recentlyViewed_" + id, joinedProducts);
        model.addAttribute("recentlyViewedProducts", joinedProducts);
        cookie.setMaxAge(24 * 60 * 60); // ��Ű�� ��ȿ �ð� (�� ����), ���⼭�� 1�Ϸ� ����
        //cookie.setMaxAge(60); // 1������ ����
        cookie.setPath("/"); // ��Ű�� ��� ����
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
        String id = pri.getName(); // ����� ID ������

        // ��Ű���� �ֱ� �� ��ǰ ������ �о��
        String recentlyViewedProduct = getRecentlyViewedProductFromCookie(request, id);

        // �ֱ� �� ��ǰ ������ ����Ʈ�� ��ȯ (���÷� ���ڿ��� ǥ��)
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
         // ��ǰ �� ���� �̹��� ����
         service.deleteProduct(companyid, category, category2, flavor);
         service.deleteProductimg(companyid, category, category2, flavor);
         service.fileDelete(companyid, category, category2, flavor,path);
         redirectAttributes.addFlashAttribute("��ǰ�� ���������� �����Ǿ����ϴ�.");
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
	     // ��ǰ ���� ��ȸ
	     ProductDTO product = service.findproductdetail(companyid, category, category2, flavor);
	     // ��ǰ �̹��� ��ȸ
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
        //companyid, category, category2, flavor �����Ǹ�
        ProductDTO pdto=mapper.getProductCodeByNum(productDTO.getNum());
        
        if(pdto.getCompanyid()!=productDTO.getCompanyid()||pdto.getCategory()!=productDTO.getCategory()||
        		pdto.getCategory2()!=productDTO.getCategory2()||pdto.getFlavor()!=productDTO.getFlavor()) {
        	//���� productimg DB 
        	//���� �����
        	for(String thumname:thumfileNames) {
        		String ext = thumname.substring(thumname.lastIndexOf(".")); 
        		img.setExt(ext);
    	    	img.setThum(1);
        		//DB�߰�
        		service.insertProductimg(img, companyid);
        		String newfilename = companyid + category + category2 + flavor + "F" + mapper.selectMaxProductSeq(companyid) + ext;
        		File saveFile = new File(path, thumname);
        		File newFile = new File(path, newfilename);
        		//���� ������ ����
	    		try {
	    			//���� �̸� ����
	    			 saveFile.renameTo(newFile);
    			}catch (Exception e) {
	    				e.printStackTrace();
    			}
	    		//������ DB���� 
	    		service.deleteProductimgnum(thumnums);
        	}
        	//���� ��ǰ�����̹���
        	for(String imgname:imgfileNames) {
        		String ext = imgname.substring(imgname.lastIndexOf(".")); 
        		img.setExt(ext);
    	    	img.setThum(0);
        		//DB�߰�
        		service.insertProductimg(img, companyid);
        		String newfilename = companyid + category + category2 + flavor + "F" + mapper.selectMaxProductSeq(companyid) + ext;
        		File saveFile = new File(path, imgname);
        		File newFile = new File(path, newfilename);
        		//���� ������ ����
	    		try {
	    			//���� �̸� ����
	    			 saveFile.renameTo(newFile);
    			}catch (Exception e) {
	    				e.printStackTrace();
    			}
	    		service.deleteProductthumimg(imgnums);
        	}
        }
	    service.updateProduct(productDTO);  // ��ü ����
	    
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

	            // Ȯ���ڿ� ��Ÿ ������ DB�� ����
	            dto.setExt(ext);
	            dto.setThum(1);
	            service.insertProductimg(dto, dto.getCompanyid());

	            // ���� ���ε�
	            service.fileUpload(dto.getCompanyid(), dto.getCategory(), dto.getCategory2(), dto.getFlavor(), thumbnail, path);
	            isfile++;
		 }
		 dto.setIsfile(dto.getIsfile()+isfile);
		    // �����ͺ��̽��� ��ǰ isfile
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
		 // ���ο� ���� ���ε� + DB ����
		 for (MultipartFile attachment : attachments) {
			 String originalFilename = attachment.getOriginalFilename();
	            String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
	            if (ext == null) ext = "";

	            // Ȯ���ڿ� ��Ÿ ������ DB�� ����
	            dto.setExt(ext);
	            dto.setThum(0);
	            service.insertProductimg(dto, dto.getCompanyid());

	            // ���� ���ε�
	            service.fileUpload(dto.getCompanyid(), dto.getCategory(), dto.getCategory2(), dto.getFlavor(), attachment, path);
	            isfile++;
		 }
		 dto.setIsfile(dto.getIsfile()+isfile);
		 
		 // �����ͺ��̽��� ��ǰ isfile
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




















