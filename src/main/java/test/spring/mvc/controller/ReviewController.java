package test.spring.mvc.controller;

import java.util.ArrayList;
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
	public String  list(Model model) {
		List<ReviewDTO> review = service.list();
		//List<AllimgDTO> img = service.img(num);
		model.addAllAttributes(review);
		//model.addAllAttributes(img);
		return "review/list";
	}
	
	@RequestMapping("write")
	public String write(Model model,ReviewDTO rdto, AllimgDTO adto) {
		return "review/write";
	}
	@RequestMapping("writepro")
	public String writepro(Model model, ReviewDTO rdto, AllimgDTO adto, HttpServletRequest request, @RequestParam("file") List<MultipartFile> files) {

	    return "redirect:/seller/store"; // 성공 시 페이지 리다이렉션
	}

}
