package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayDTO {
	private String tid; //결제 고유 번호
	private String next_redirect_pc_url; //요청한 클라이언트가 PC웹
	private Date created_at;
}
