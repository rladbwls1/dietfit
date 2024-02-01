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
		
		public void companyStatus(String status, String id);
		public String getLastCompanyId();
		public String getCompanyId(String id);
		public String generateCompanyId(String companyid, String id);
		
		public int allProductcount();
		public void allProduct(Model model);
		
		public int productcount(String companyid);
		public void productList(Model model, String companyid);
		
		public void checkStock();
		
		public void getProductName(String companyid, String category, String category2, String flavor, Model model);
		public void getProductStock(String product, Model model);
		public String getCompanyEmail(String companyid);

}
