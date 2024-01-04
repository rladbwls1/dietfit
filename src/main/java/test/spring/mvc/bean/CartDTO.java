package test.spring.mvc.bean;

import lombok.Data;

@Data
public class CartDTO {
	private int num;
	private String product;
	private int price;
	private int quantity;
}
