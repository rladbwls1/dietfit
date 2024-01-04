package test.spring.mvc.bean;

import lombok.Data;

@Data
public class DeliveryDTO {
	private String name;
	private String addr1;
	private String addr2;
	private String phone;
	private int defaultaddr;
	private String nicaddr;
}
