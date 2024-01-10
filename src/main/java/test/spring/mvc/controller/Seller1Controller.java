package test.spring.mvc.controller;

import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.repository.Seller1Mapper;
import test.spring.mvc.service.Seller1Service;

@Controller
@RequestMapping("/seller/**")
public class Seller1Controller {
	@Autowired
    private Seller1Service service;
	
	@Autowired
	private Seller1Mapper sellermapper;
	
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

	    // �����ͺ��̽��� Product ���� ����
	    service.insertProduct(dto, img, companyid);

	    // selectMaxProductSeq �� ��ȸ
	    int maxProductSeq = service.selectMaxProductSeq(companyid);

	    return "redirect:seller/store/home";
	}


    @RequestMapping("/store/home")
    public String main() {
    	return "seller/home";
    }
	
	@GetMapping("/{companyid}/{category}/{category2}/{flavor}/{num}/{ext}/{thum}")
	public String getImageUrl(@PathVariable String companyid,
	                          @PathVariable String category,
	                          @PathVariable String category2,
	                          @PathVariable String flavor,
	                          @PathVariable String num,
	                          @PathVariable String ext,
	                          @PathVariable String thum) {
	    // �̹��� ������ ����� ���丮 ��� ���� (��: ����ȭ��-�Ĵ�����)
	    String directoryPath = "C:\\Users\\y\\Desktop\\dietfitfile";

	    // �̹��� ������ ��ü ��� ����
	    String filename = companyid + category + category2 + flavor + num + ext;
	    String imagePath = Paths.get(directoryPath, filename).toString();

	    // �̹��� ������ URL�� ��ȯ�Ͽ� ��ȯ
	    return "file:" + imagePath;
	}
	
	 @GetMapping("/details/{companyid}/{category}/{category2}/{flavor}")
	    public String detail(@PathVariable ("companyid") String companyid,
	                         @PathVariable ("category") String category,
	                         @PathVariable ("category2") String category2,
	                         @PathVariable ("flavor") String flavor,
	                         Model model) {
	        // ���⿡�� �ʿ��� ������ �����ϰ�, �ʿ��� �����͸� �𵨿� �߰��ϼ���
	        ProductDTO product = service.findproductdetail(companyid, category, category2, flavor);
	        model.addAttribute("product", product);

	        return "seller2/productdetail";
	    }
}
