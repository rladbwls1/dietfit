package test.spring.mvc.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.service.Seller1Service;

@Controller
@RequestMapping("/seller/*")
public class Seller1Controller {
	@Autowired
    private Seller1Service service;
    
    // 상품 등록 페이지
    @RequestMapping("productadd")
    public String productadd(@RequestParam("id") String id, Model model) {
    	String companyid = service.selectcompanyid(id);
        model.addAttribute("companyid", companyid);
        return "seller/productadd";
    }


    @RequestMapping("productaddPro")
    public String productAddPro(ProductDTO dto,
                                ProductimgDTO img,
                                @RequestParam("companyid") String companyid,
                                @RequestParam("thumbnail") MultipartFile[] thumbnails,
                                @RequestParam("attachments") MultipartFile[] attachments,
                                HttpServletRequest request) {
        // 제품 정보 저장
        dto.setCompanyid(companyid);
        img.setCompanyid(companyid);
        
        List<MultipartFile> allFiles = new ArrayList<>();

        // 썸네일 파일들을 리스트에 추가
        allFiles.addAll(Arrays.asList(thumbnails));
        // 첨부 파일들을 리스트에 추가
        allFiles.addAll(Arrays.asList(attachments));

        int isfile = 0;
        String ext = "";
        for (MultipartFile f : allFiles) {
            if (!f.getOriginalFilename().equals("")) {
                isfile++;
                // 파일 이름에서 마지막 '.'의 위치 찾기
                int dotIndex = f.getOriginalFilename().lastIndexOf('.');
                // 확장자 추출 (마지막 '.' 포함)
                if (dotIndex != -1) {
                    ext = f.getOriginalFilename().substring(dotIndex);
                }
            }
        }
        dto.setIsfile(isfile);
        // 확장자 추출 후 저장
        img.setExt(ext);
        // 파일 저장
        service.insertProduct(dto, img, companyid);
        return "redirect:/list";
    }

    @RequestMapping("list")
    public String list() {
        return "seller/list";
    }
}
