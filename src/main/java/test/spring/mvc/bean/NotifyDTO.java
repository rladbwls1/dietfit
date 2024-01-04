package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class NotifyDTO {
	private int num;
	private String id;
	private String title;
	private String content;
	private int isfile;
	private int viewcount;
	private Date reg;
	private String companyid;
	private int board;
}
