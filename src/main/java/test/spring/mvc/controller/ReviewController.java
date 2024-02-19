package test.spring.mvc.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import test.spring.mvc.bean.AllimgDTO;
import test.spring.mvc.bean.RecommendDTO;
import test.spring.mvc.bean.ReviewDTO;
import test.spring.mvc.repository.ReviewMapper;
import test.spring.mvc.service.ReviewService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	private ReviewMapper mapper;
	@Autowired
    private ReviewService service;
	
	@RequestMapping("list")
    public String list(Model model,Principal pri) {
		if(pri!=null) {
			String id=pri.getName();
			model.addAttribute("recommendNums",mapper.getRecommend(id));
			model.addAttribute("id",id);
		}
        List<ReviewDTO> review = service.listimg();
        model.addAttribute("review", review);
        return "review/list";
    }
	@RequestMapping("myReview")
	public String myReview(Model model,Principal pri) {
		String id=pri.getName();
		model.addAttribute("recommendNums",mapper.getRecommend(id));
		model.addAttribute("id",id);
		model.addAttribute("review", mapper.getListById(id));
		return "review/myReview";
	}
	
	@RequestMapping("write")
	public String write(Principal pri, ReviewDTO rdto,Model model) {
		String id=pri.getName();
		ReviewDTO review = service.writeproduct(rdto);
		//상품명과 썸네일 이미지 이름
		model.addAttribute("review",review);
		//상품코드와 주문번호
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
		rdto.setIsfile(fileCount);
		service.write(rdto); // 리뷰 정보 저장
		
		// 파일이 존재하는 경우 처리
	    if (!files.isEmpty()) {
	        for (MultipartFile file : files) {
	            // 파일 저장 로직
	            String uuid = service.fileupload(file, path); // 실제 파일을 저장하고, UUID 반환

	            if (uuid != null) {
	                adto.setAttatch(uuid); // 파일명(UUID) 설정
	                //System.out.println("파일이름========="+uuid);
	                adto.setId(id);	
	                service.writeimg(adto); // 이미지 정보 저장
	            }
	        }
	    }
		return "redirect:/member/myOrder"; 
	}
	
	// 따봉 추가 
	@RequestMapping("Good")
	public @ResponseBody String Good(String id, int reviewnum){
		RecommendDTO dto=new RecommendDTO();
		dto.setId(id);
		dto.setReviewnum(reviewnum);
		service.good(dto);
		return "good";
	}
	// 따봉 취소 
	@RequestMapping("Bye")
	public @ResponseBody String Bye(String id, int reviewnum){
		RecommendDTO dto=new RecommendDTO();
		dto.setId(id);
		dto.setReviewnum(reviewnum);
		service.bye(dto);
		return "bye";
	}
	// 리뷰 삭제  
	@RequestMapping("delete")
	public @ResponseBody String delete(int reviewnum){
		service.delete(reviewnum);
		return "bye";
	}
	

}
