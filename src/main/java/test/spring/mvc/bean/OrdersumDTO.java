package test.spring.mvc.bean;

import lombok.Data;

//memId orderid, point, couponid, discount, totalamount

@Data
public class OrdersumDTO {
	private String id; //회원 ID
	private String orderid; //주문번호
	private int point; //사용 적립금
	private String couponid; //사용 쿠폰 ID
	private int coupondiscount; //쿠폰 할인 금액
	private int totalamount; //총 결제 금액
}
