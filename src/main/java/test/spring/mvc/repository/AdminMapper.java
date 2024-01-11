package test.spring.mvc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;

public interface AdminMapper {
	public int companycount();
	public List<Member_basicDTO> companyList();
	public Member_basicDTO companyBasic(String id);
	public Member_detailDTO companyDetail(String id);
	public void companyStatus (@Param("id") String id, 
			@Param("status") String status);
	
	public int allProductcount();
	public List<ProductDTO> allProduct();
	
	public int productcount();
	public List<ProductDTO> productList(String companyid);
	
	public String getCompanyName(String companyid);
	public String getProductId(String product);
	public String getProductName(@Param("companyid") String companyid,
			@Param("category") String category, 
			@Param("category2") String category2,
			@Param("flavor") String flavor);
	public int getProductStock(String product);
	public String getCompanyEmail(String companyid);
}
