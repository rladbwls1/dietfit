package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class Member_detailDTO {
	private String id;
	private Date birth;
	private String phone;
	private int gender;
	private String addr1;
	private String addr2;
	private int path;
	private String companyid;
	private String company;
	private String businessnum;
}
