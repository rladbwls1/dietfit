package test.spring.mvc.repository;

import test.spring.mvc.bean.Member_detailDTO;

public interface Admin1Mapper {
	public Member_detailDTO mem_info(String id);
	public void up_mem_info(Member_detailDTO dto);
}
