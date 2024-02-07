package test.spring.mvc.bean;

import lombok.Data;

@Data
public class AllimgDTO {
	private int num;		// 번호
	private String id;		// 사용자 아이디 
	private int type;		// 게시판 종류
	private int notifynum;
	private String attatch;	// 파일명 
}
