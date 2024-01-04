package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class SellDTO {
	private int num;
	private String id;
	private String title;
	private String content;
	private int isfile;
	private int viewcount;
	private Date reg;
	private int sell;
}
