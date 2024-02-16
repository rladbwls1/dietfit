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
	// 회원의 작성 리뷰 리스트
	public List<ReviewDTO> getListById(String id);
	
	// 리뷰 글 저장
	public void write(ReviewDTO rdto);
	// 리뷰 이미지 저장 
	public void writeimg(AllimgDTO adto);
	
    // 리뷰 추천하기
    public void addRecommend(RecommendDTO dto);

    // 리뷰 상세 추천수 증가
    public void upRecommend(RecommendDTO dto);

    // 리뷰 추천 취소하기
    public void removeRecommend(RecommendDTO dto);
	// 해당 리뷰 추천 여부 판단
    public List<Integer> getRecommend(String id);
	
    
    
	// 리뷰 정보 삭제하기
	// 리뷰 이미지 삭제하기
	
	
}
