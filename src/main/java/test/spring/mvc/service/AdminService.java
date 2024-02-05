package test.spring.mvc.service;

import java.util.List;

import org.springframework.ui.Model;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.OrderdetailDTO;

public interface AdminService {
	//판매자
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
		
		public int stocklesscount(int stock);
		public void stockless(Model model, int stock);
		public void checkstock(String product);
		
		public int productcount(String companyid);
		public void productList(Model model, String companyid);
		
		
		public void getProductName(String companyid, String category, String category2, String flavor, Model model);
//		public void getProductStock(String product, Model model);
		public String getCompanyEmail(String companyid);
		
		//주문번호
		public String generateOrderId();
		public List<String> findproductId(String id, String nums);
		public void createOrder(String id, OrderdetailDTO orderdetail);
		
		
}
