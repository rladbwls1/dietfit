package test.spring.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class DiscountDTO {
	private int num;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startr;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endr;
	private int sale;
}
