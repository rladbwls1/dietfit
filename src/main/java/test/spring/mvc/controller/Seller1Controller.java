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
    
    // ��ǰ ��� ������
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
        // ��ǰ ���� ����
        dto.setCompanyid(companyid);
        img.setCompanyid(companyid);
        
        List<MultipartFile> allFiles = new ArrayList<>();

        // ����� ���ϵ��� ����Ʈ�� �߰�
        allFiles.addAll(Arrays.asList(thumbnails));
        // ÷�� ���ϵ��� ����Ʈ�� �߰�
        allFiles.addAll(Arrays.asList(attachments));

        int isfile = 0;
        String ext = "";
        for (MultipartFile f : allFiles) {
            if (!f.getOriginalFilename().equals("")) {
                isfile++;
                // ���� �̸����� ������ '.'�� ��ġ ã��
                int dotIndex = f.getOriginalFilename().lastIndexOf('.');
                // Ȯ���� ���� (������ '.' ����)
                if (dotIndex != -1) {
                    ext = f.getOriginalFilename().substring(dotIndex);
                }
            }
        }
        dto.setIsfile(isfile);
        // Ȯ���� ���� �� ����
        img.setExt(ext);
        // ���� ����
        service.insertProduct(dto, img, companyid);
        return "redirect:/list";
    }

    @RequestMapping("list")
    public String list() {
        return "seller/list";
    }
}
