package test.spring.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@Data
public class CommercailDTO  {
	private int num;			// 순서
	private String comname;		// 광고명
	private String companyid;	// 회사 아이디
	private String comfile;		// 광고 이미지 이름
	private int admincheck;		// 관리자 승인 여부
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startdate;		// 광고 시작
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date enddate;		// 광고 종료
	private String imagePath;   // 이미지 경로 
}
