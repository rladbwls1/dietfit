package test.spring.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderdetailDTO {
	private String orderid;		// 주문 번호
	private int price;			// 주문 상품 금액
	private int quantity;		// 주문 수량
	private int delivery;		// 정기배송
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date purdate;		// 결제 날짜
	private int pay;			// 결제 방법 
	private int purchase;		// 결제 여부
	private String productid; 	// 상품 아이디
	private String product; 	// 상품명
	private String tracking; 	// 송장번호
	private String courier;		// 택배사 번호
	private String memberid;    // 회원 아이디
	private int totalSold;     // 판매량
}
