package test.spring.mvc.repository;

import java.util.List;

import test.spring.mvc.bean.AllimgDTO;
import test.spring.mvc.bean.ReviewDTO;

public interface ReviewMapper {
	// 리뷰 작성 상품
	public String writeproduct(ReviewDTO rdto);
	// 리뷰 리스트
	public List<ReviewDTO> listimg();
	// 리뷰 글 저장
	public void write(ReviewDTO rdto);
	// 리뷰 이미지 저장 
	public void writeimg(AllimgDTO adto);
}
