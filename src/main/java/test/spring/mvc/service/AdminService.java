package test.spring.mvc.service;

import org.springframework.ui.Model;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;

public interface AdminService {
	//ÆÇ¸ÅÀÚ
		public int companycount();
		public void companyList(Model model);
		
		public Member_basicDTO companyBasic(String id);
		public Member_detailDTO companyDetail(String id);
		
		public void companyStatus(String id, String status);
		
}
