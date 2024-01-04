package test.spring.mvc.bean;

import java.util.Date;
import java.util.List;

import lombok.Builder;
import lombok.Data;
import test.spring.mvc.entity.Member_basicEntity;

@Data
public class Member_basicDTO {
	private int num;
	private String id;
	private String pw;
	private String name;
	private String nic;
	private String email;
	private Date reg;
	private List<AuthDTO> authList;
	private int status;

	@Builder
	public Member_basicDTO(int num, String id, String pw, String name, String nic, String email, Date reg, int status) {
		super();
		this.num = num;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nic = nic;
		this.email = email;
		this.reg = reg;
		this.status = status;
	}
	
	public Member_basicEntity toM_basicEntity() {
		return Member_basicEntity.builder()
				.num(this.num)
				.id(this.id)
				.pw(this.pw)
				.name(this.name)
				.nic(this.nic)
				.email(this.email)
				.reg(this.reg)
				.status(this.status)
				.build();
	}
}
