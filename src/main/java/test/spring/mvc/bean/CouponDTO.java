package test.spring.mvc.bean;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class CouponDTO {
	private int num;
	private String coupon;
	private String couponid;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date deletedate;
	private int status;
}
