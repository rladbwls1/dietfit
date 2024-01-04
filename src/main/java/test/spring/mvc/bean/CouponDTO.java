package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class CouponDTO {
	private int num;
	private String coupon;
	private Date createdate;
	private Date deletedate;
	private int status;
}
