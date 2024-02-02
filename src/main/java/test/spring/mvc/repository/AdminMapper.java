package test.spring.mvc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductinfoDTO;

public interface AdminMapper {
	public int companycount();
	public List<Member_basicDTO> companyList();
	public Member_basicDTO companyBasic(String id);
	public Member_detailDTO companyDetail(String id);
	
	public void companyStatus (@Param("status") String status, @Param("id") String id);
	public String getLastCompanyId();
	public String getCompanyId(String id);
	public void generateCompanyId(
			@Param("companyid") String companyid,
			@Param("id") String id);
	
	public int allProductcount();
	public List<ProductDTO> allProduct();
	
	public int stocklesscount(int stock);
	public List<ProductDTO> stockless(int stock);
	public int getStock(String product);
	public String getCompanyid(String productname);
	public String getCategory(String productname);
	public String getCategory2(String productname);
	public String getFlavor(String productname);
	
	public int productcount(String companyid);
	public List<ProductDTO> productList(String companyid);
	
	public String getCompanyName(String companyid);
	public String getProductId(String product);
	public String getProductName(@Param("companyid") String companyid,
			@Param("category") String category, 
			@Param("category2") String category2,
			@Param("flavor") String flavor);
	public String getCompanyEmail(String companyid);
	
	//½Ä´Ü!!!!
	public List<String> getProtein(int protein);
	
	public int detailCount();
	public List<ProductinfoDTO> allProductDetail();
	
	//ÄíÆù
	public int couponcount();
	public List<AllcouponDTO> couponList();
	
	

}
