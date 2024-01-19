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
	private String productid; 	// 상품 아이디
	private String product; 	// 상품명
	private String tracking; 	// 송장번호
	private String courier;		// 택배사 번호 
}
