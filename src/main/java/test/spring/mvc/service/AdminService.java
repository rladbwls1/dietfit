package test.spring.mvc.service;

import org.springframework.ui.Model;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;

public interface AdminService {
	//ÆÇ¸ÅÀÚ
		public int companycount();
		public void companyList(int pageNum, Model model);
		
		public Member_basicDTO companyBasic(String id);
		public Member_detailDTO companyDetail(String id);
		
		public void companyStatus(String id, String status);
		
		public int allProductcount();
		public void allProduct(int pageNum, Model model);
		
		public int productcount();
		public void productList(int pageNum, Model model, String companyid);
		
		public void checkStock();
		
		public void getProductName(String companyid, String category, String category2, String flavor, Model model);
		public void getProductStock(String product, Model model);
		public String getCompanyEmail(String companyid);

}
