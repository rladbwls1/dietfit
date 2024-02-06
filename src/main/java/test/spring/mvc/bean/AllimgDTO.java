package test.spring.mvc.bean;

import lombok.Data;

@Data
public class AllimgDTO {
	private int num;		// 번호
	private String id;		// 사용자 아이디 
	private int type;		// 게시판 종류
	private String attach;	// 파일명 
	private String filepath; // 파일 경로 저장
}
