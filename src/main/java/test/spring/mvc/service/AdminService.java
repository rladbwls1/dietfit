package test.spring.mvc.service;

import org.springframework.ui.Model;

import test.spring.mvc.bean.Member_detailDTO;

public interface AdminService {
	//�Ǹ���
		public int companycount();
		public void companyList(Model model);
		public Member_detailDTO companyDetail(String id);

}
