package test.spring.mvc.repository;

import test.spring.mvc.bean.Member_basicDTO;

public interface SecurityMapper {
	public Member_basicDTO read(String userid);
}
