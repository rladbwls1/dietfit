package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private int num;				// �Խ��� ��ȣ 
	private String companyid;		// ��üID
	private String category;		// ī�װ� �Һз� 
	private String category2;		// ���ǹ�ȣ 2�ڸ�
	private String flavor;			// �� �з�
	private String id;				// ����� ���̵�
	private String writer;			// �ۼ��� 
	private int starscore;			// ����
	private String content;			// ���� ����
	private int isfile;				// ���� ����
	private Date reg;				// ��� 
	private int recommend;			// ��õ��
	private String attatch;			// ���ϸ�
	private String boardname;		// ��ǰ �̸� 
	private String filename;		// ��ǰ �̹���
}
