package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private int num;				// 게시판 번호 
	private String companyid;		// 업체ID
	private String category;		// 카테고리 소분류 
	private String category2;		// 임의번호 2자리
	private String flavor;			// 맛 분류
	private String id;				// 사용자 아이디
	private String writer;			// 작성자 
	private int starscore;			// 별점
	private String content;			// 리뷰 내용
	private int isfile;				// 파일 갯수
	private Date reg;				// 등록 
	private int recommend;			// 추천수
	private String attatch;			// 파일명
	private String boardname;		// 상품 이름 
	private String filename;		// 상품 이미지
}
