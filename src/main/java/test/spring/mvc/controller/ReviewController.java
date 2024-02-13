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
import test.spring.mvc.bean.ReviewDTO;
import test.spring.mvc.service.ReviewService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
    private ReviewService service;
	
	@RequestMapping("list")
    public String list(Model model) {
        // 리뷰와 이미지 정보를 조회
        List<ReviewDTO> reviewImages = service.listimg();
        // 모델에 조회된 정보 추가
        model.addAttribute("reviewImages", reviewImages);
        // 뷰 이름 반환
        return "review/list";
    }


	@RequestMapping("write")
	public String write(Principal pri, ReviewDTO rdto,Model model) {
		String id=pri.getName();
		
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
		// 로그인된 아이디 
		String id=pri.getName();
		rdto.setId(id);
		rdto.setWriter(id);
		// 저장 파일 경로
		String path = request.getServletContext().getRealPath("/resources/review/");
		// 파일 갯수 
		int fileCount = (files != null) ? files.size() : 0;
		System.out.println(fileCount);
		rdto.setIsfile(fileCount);
		service.write(rdto); // 리뷰 정보 저장
		
		// 파일이 존재하는 경우 처리
	    if (!files.isEmpty()) {
	        for (MultipartFile file : files) {
	            // 파일 저장 로직
	            String uuid = service.fileupload(file, path); // 실제 파일을 저장하고, UUID 반환

	            if (uuid != null) {
	                adto.setAttatch(uuid); // 파일명(UUID) 설정
	                System.out.println("파일이름========="+uuid);
	                adto.setId(id);	
	                service.writeimg(adto); // 이미지 정보 저장
	            }
	        }
	    }
		return "redirect:/member/myOrder"; 
	}

}
