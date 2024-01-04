package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class SetproductDTO {
	private String orderid;
	private String productid;
	private int price;
	private int quantity;
	private Date decidedate;
}
