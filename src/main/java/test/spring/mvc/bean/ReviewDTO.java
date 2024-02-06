package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private String num;				// 게시판 번호 
	private String productid;		// 업체 ID
	private String id;				// 사용자 아이디
	private String writer;			// 작성자 
	private int starscore;			// 별점
	private String content;			// 리뷰 내용
	private int isfile;				// 파일 갯수
	private Date reg;				// 등록 
	private int recommend;			// 추천수
}
