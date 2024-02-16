package test.spring.mvc.repository;

import java.util.List;

import test.spring.mvc.bean.AllimgDTO;
import test.spring.mvc.bean.RecommendDTO;
import test.spring.mvc.bean.ReviewDTO;

public interface ReviewMapper {
	// 리뷰 작성 상품
	public ReviewDTO writeproduct(ReviewDTO rdto);
	// 리뷰 리스트
	public List<ReviewDTO> listimg();
	
	// 리뷰 글 저장
	public void write(ReviewDTO rdto);
	// 리뷰 이미지 저장 
	public void writeimg(AllimgDTO adto);
	
    // 리뷰 추천하기
    public void good(RecommendDTO recdto);

    // 리뷰 상세 추천수 증가
    public void goodreview(ReviewDTO rdto);

    // 리뷰 추천 취소하기
    public void bye(RecommendDTO recdto);
	
	
	// 리뷰 추천 아이디별로 찾기
	// 리뷰 정보 삭제하기
	// 리뷰 이미지 삭제하기
	
	
}
