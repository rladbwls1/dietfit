package test.spring.mvc.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import test.spring.mvc.bean.Member_basicDTO;

@Data
@NoArgsConstructor
@Entity
@Table(name="member_basic")
public class Member_basicEntity {
	private int num;
	@Id
	private String id;
	private String pw;
	private String name;
	private String nic;
	private String email;
	@Temporal(TemporalType.TIMESTAMP)
	private Date reg;
	private int status;
	
	@Builder
	public Member_basicEntity(int num, String id, String pw, String name, String nic, String email, Date reg, int status) {
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
	
	public Member_basicDTO toM_basicDTO() {
		return Member_basicDTO.builder()
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
