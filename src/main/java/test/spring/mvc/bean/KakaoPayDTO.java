package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayDTO {
	private String tid; //���� ���� ��ȣ
	private String next_redirect_pc_url; //��û�� Ŭ���̾�Ʈ�� PC��
	private Date created_at;
}
