package test.spring.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AllcouponDTO {
	private String coupon;
	private String couponid;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date deletedate;
	private String companyid;
	private int download;
	private int discount;
	private String boardnums;
	private int admincheck;
}
