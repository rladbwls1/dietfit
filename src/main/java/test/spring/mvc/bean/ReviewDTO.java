package test.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private String num;
	private String productid;
	private String id;
	private String writer;
	private int starscore;
	private String content;
	private int isfile;
	private Date reg;
	private int recommend;
}
