package test.spring.mvc.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import test.spring.mvc.bean.AllimgDTO;
import test.spring.mvc.bean.RecommendDTO;
import test.spring.mvc.bean.ReviewDTO;
import test.spring.mvc.service.ReviewService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
    private ReviewService service;
	
	@RequestMapping("list")
    public String list(Model model) {
        List<ReviewDTO> review = service.listimg();
        model.addAttribute("review", review);
        return "review/list";
    }
	
	@RequestMapping("write")
	public String write(Principal pri, ReviewDTO rdto,Model model) {
		String id=pri.getName();
		ReviewDTO review = service.writeproduct(rdto);
		model.addAttribute("review",review);
		model.addAttribute("rdto",rdto);
		model.addAttribute("id",id);
		return "review/write";
	}
	
	@RequestMapping("writepro")
	public String writepro(Model model, 
						   Principal pri,
						   ReviewDTO rdto, 
						   AllimgDTO adto, 
						   HttpServletRequest request, 
						   @RequestParam("file") List<MultipartFile> files) {
		// �α��ε� ���̵� 
		String id=pri.getName();
		rdto.setId(id);
		rdto.setWriter(id);
		// ���� ���� ���
		String path = request.getServletContext().getRealPath("/resources/review/");
		// ���� ���� 
		int fileCount = (files != null) ? files.size() : 0;
		rdto.setIsfile(fileCount);
		service.write(rdto); // ���� ���� ����
		
		// ������ �����ϴ� ��� ó��
	    if (!files.isEmpty()) {
	        for (MultipartFile file : files) {
	            // ���� ���� ����
	            String uuid = service.fileupload(file, path); // ���� ������ �����ϰ�, UUID ��ȯ

	            if (uuid != null) {
	                adto.setAttatch(uuid); // ���ϸ�(UUID) ����
	                adto.setId(id);	
	                service.writeimg(adto); // �̹��� ���� ����
	            }
	        }
	    }
		return "redirect:/member/myOrder"; 
	}
	
	// ���� �߰� 
	@RequestMapping("Good")
	public String Good(Principal pri, ReviewDTO rdto, RecommendDTO redto1){
		String id=pri.getName();
		service.good(redto1);
///		service.goodreview(redto);
		return "redirect:/review/list";
	}
	// ���� ��� 
	@RequestMapping("Bye")
	public String Bye(){
		
		return "";
	}

}
