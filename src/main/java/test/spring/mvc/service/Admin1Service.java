package test.spring.mvc.service;

import org.springframework.ui.Model;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;

public interface Admin1Service{
	public int count();
	public void MemberList(int pageNum, Model model);
	public Member_basicDTO info(String id);
	public Member_detailDTO mem_info(String id);
	public int up_mem_info(Member_detailDTO dto, Member_basicDTO mb);
	public int NicCheck(String nic);
}
