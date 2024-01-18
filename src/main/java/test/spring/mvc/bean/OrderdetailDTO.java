package test.spring.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderdetailDTO {
	private String orderid;
	private int price;
	private int quantity;
	private int discount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date purdate;
	private String pay;
	private int purchase;
	private String productid; 	// ��ǰ ���̵�
	private String product; 	// ��ǰ��
	private String tracking; 	// �����ȣ
	private String courier;		// �ù�� ��ȣ 
}
