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
	    return "seller/productList";
	}
	
    // ��ǰ ��� ������
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

	    // ��ǰ ���� ����
	    dto.setCompanyid(companyid);
	    img.setCompanyid(companyid);

	    List<MultipartFile> thumbnailList = thumbnails != null ? Arrays.asList(thumbnails) : new ArrayList<>();
	    List<MultipartFile> attachmentList = attachments != null ? Arrays.asList(attachments) : new ArrayList<>();

	    // ���� ���� ���
	    int thumbnailCount = thumbnailList.size();
	    int attachmentCount = attachmentList.size();

	    // ���� �� ���� ����
	    dto.setIsfile(thumbnailCount + attachmentCount);
	    
	    // attachmentList Ȯ���� ���� �� DB�� ����
	    for (MultipartFile attachment : attachmentList) {
	        String originalFilename = attachment.getOriginalFilename();
	        String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
	        
	        // Ȯ���� ���� �� DB�� ���� (���⿡���� ���÷� thum ���� 0�� ����)
	        img.setExt(ext);
	        img.setThum(0);
	        service.insertProductimg(img, companyid);
	        service.fileUpload(companyid, img.getCategory(), img.getCategory2(), img.getFlavor(), attachment);
	        
	        }
	    
	    // thumbnail Ȯ���� ���� �� DB�� ����
	    for (MultipartFile thumbnail : thumbnailList) {
	        String originalFilename = thumbnail.getOriginalFilename();
	        String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
	        
	        // Ȯ���� ���� �� DB�� ���� (���⿡���� ���÷� thum ���� 1�� ����)
	        img.setExt(ext);
	        img.setThum(1);
	        service.insertProductimg(img, companyid);
	        service.fileUpload(companyid, img.getCategory(), img.getCategory2(), img.getFlavor(), thumbnail);
	    }
	    
	    // img ��ü�� �ʿ��� �ʵ带 ����
	    img.setCategory(category);
	    img.setCategory2(category2);
	    img.setFlavor(flavor);

	    
	    // �����ͺ��̽��� ��ǰ ����
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
	                             RedirectAttributes redirectAttributes) {
	         // ��ǰ �� ���� �̹��� ����
	         service.deleteProduct(companyid, category, category2, flavor);
	         service.deleteProductimg(companyid, category, category2, flavor);
	         service.fileDelete(companyid, category, category2, flavor);
	         redirectAttributes.addFlashAttribute("successMessage", "��ǰ�� ���������� �����Ǿ����ϴ�.");

	     return "redirect:/seller/store/home";
	 }
	 
	 @RequestMapping("/store/Update")
	 public String updateForm(Model model, 
	                          @RequestParam("companyid") String companyid, 
	                          @RequestParam("category") String category, 
	                          @RequestParam("category2") String category2, 
	                          @RequestParam("flavor") String flavor) {
	     // ��ǰ ���� ��ȸ
	     ProductDTO dto = service.findproductdetail(companyid, category, category2, flavor);
	     List<ProductimgDTO> imgList = service.imgfindupdate(companyid, category, category2, flavor);

	     // �𵨿� ��ǰ ������ �̹��� ��� �߰�
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