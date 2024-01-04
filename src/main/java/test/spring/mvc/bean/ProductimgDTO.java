package test.spring.mvc.bean;

import lombok.Data;

@Data
public class ProductimgDTO { 
	private String companyid;	// 업체 ID
	private String category;	// 카테고리 소분류
	private String category2;	// 임의 번호 2자리
	private String flavor;		// 맛 분류
	private int num;			// 파일 이름2 시퀀스
	private String ext;			// 이미지 파일 확장자
	private int thum;			// 썸네일 
}
