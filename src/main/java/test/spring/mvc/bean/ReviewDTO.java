package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private String num;				// �Խ��� ��ȣ 
	private String productid;		// ��ü ID
	private String id;				// ����� ���̵�
	private String writer;			// �ۼ��� 
	private int starscore;			// ����
	private String content;			// ���� ����
	private int isfile;				// ���� ����
	private Date reg;				// ��� 
	private int recommend;			// ��õ��
}
