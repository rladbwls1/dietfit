package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class OrderdetailDTO {
	private String orderid;
	private int price;
	private int quantity;
	private int discount;
	private Date purdate;
	private String pay;
	private int purchase;
}
