package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class BuyproductDTO {
	private int num;
	private String companyid;	// ��üID
	private String category;	// ī�װ� �Һз� 
	private String category2;	// ���ǹ�ȣ 2�ڸ�
	private String flavor;		// �� �з�
	private String id;			// ȸ�� ���̵�
	private String orderid;		// �ֹ� ��ȣ
	private int quantity;		// �ֹ� ����
	private Date setdate;		// ���� Ȯ����
	private int price;			// �ֹ� ��ǰ ����
}
