package test.spring.mvc.bean;

import lombok.Data;

//memId orderid, point, couponid, discount, totalamount

@Data
public class OrdersumDTO {
	private String id; //ȸ�� ID
	private String orderid; //�ֹ���ȣ
	private int point; //��� ������
	private String couponid; //��� ���� ID
	private int coupondiscount; //���� ���� �ݾ�
	private int totalamount; //�� ���� �ݾ�
}
