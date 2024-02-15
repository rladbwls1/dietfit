package test.spring.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderdetailDTO {
	private String orderid;		// �ֹ� ��ȣ
	private int price;			// �ֹ� ��ǰ �ݾ�
	private int quantity;		// �ֹ� ����
	private int delivery;		// ������
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date purdate;		// ���� ��¥
	private int pay;			// ���� ��� 
	private int purchase;		// ���� ����
	private String productid; 	// ��ǰ ���̵�
	private String product; 	// ��ǰ��
	private String tracking; 	// �����ȣ
	private String courier;		// �ù�� ��ȣ
	private String memberid;    // ȸ�� ���̵�
	private int totalSold;     // �Ǹŷ�
}
