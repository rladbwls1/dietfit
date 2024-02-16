package test.spring.mvc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import test.spring.mvc.bean.AllimgDTO;
import test.spring.mvc.bean.RecommendDTO;
import test.spring.mvc.bean.ReviewDTO;

public interface ReviewService {
	// 리뷰 작성 상품
	public ReviewDTO writeproduct(ReviewDTO rdto);
	// 리뷰 리스트 
	public List<ReviewDTO> listimg();
	// 리뷰 글 작성
	public void write(ReviewDTO rdto);
	// 리뷰 이미지 저장
	public void writeimg(AllimgDTO adto);
	// 실제 파일 업로드 
	public String fileupload(MultipartFile file, String path);
    // 리뷰 추천하기
	public void good(RecommendDTO recdto);
    // 리뷰 상세 추천수 증가
    public void goodreview(ReviewDTO rdto);
    // 리뷰 추천 취소하기
    public void bye(RecommendDTO recdto);
}
