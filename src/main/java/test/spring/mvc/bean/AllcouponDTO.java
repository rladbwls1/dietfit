package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class AllcouponDTO {
	private String coupon;
	private String couponid;
	private Date createdate;
	private Date deletedate;
	private String companyid;
	private int download;
	private int discount;
	private String boardnums;
	private int admincheck;
	private int minprice;
	private String content;
}
