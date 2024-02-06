package test.spring.mvc.repository;

import java.util.List;

import test.spring.mvc.bean.AllimgDTO;
import test.spring.mvc.bean.ReviewDTO;

public interface ReviewMapper {
	// 리뷰 전체 글
	public List<ReviewDTO> list();
	
	// 리뷰 이미지
	public List<AllimgDTO> img(int num);
	
	// 리뷰 글 작성
	public ReviewDTO write(ReviewDTO rdto);
	
	public AllimgDTO writeimg(AllimgDTO adto);
}
