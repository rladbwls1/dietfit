package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class BuyproductDTO {
	private int num;
	private String companyid;	// 업체ID
	private String category;	// 카테고리 소분류 
	private String category2;	// 임의번호 2자리
	private String flavor;		// 맛 분류
	private String id;			// 회원 아이디
	private String orderid;		// 주문 번호
	private int quantity;		// 주문 수량
	private Date setdate;		// 구매 확정일
	private int price;			// 주문 상품 가격
}
