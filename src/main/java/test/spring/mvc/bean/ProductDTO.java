package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private String num; 		// ��ȣ
	private String boardname;	// �Խñ۸�
	private String companyid;	// ��üID
	private String category;	// ī�װ� �Һз� 
	private String category2;	// ���ǹ�ȣ 2�ڸ�
	private String flavor;		// �� �з�
	private String detail;		// �󼼼���
	private int isfile;			// ���� ����
	private String delvery;		// �������
	private Date reg;			// ��ϳ�¥
	private int count;			// ��ȸ��
	private String product;		// ��ǰ��
	private int stock;			// ����
	private Date expiry;		// �������
	private String price;		// ����
}
