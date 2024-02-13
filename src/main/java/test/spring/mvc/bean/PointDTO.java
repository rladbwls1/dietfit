package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class PointDTO {
	private int num;
	private int opt;
	private int change;
	private Date createdate;
	private Date duedate;
	private String orderid;
	private int point;
	private Date deletedate;
}
