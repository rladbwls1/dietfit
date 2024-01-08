package test.spring.mvc.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface SellerMapper {
	public List<ProductDTO> findallproductbycompanyid(String companyid);
	public List<ProductimgDTO> findthumimg(String companyid, String category, String category2, String flavor);
	public List<ProductimgDTO> findthumimg(Map<String, Object> params);
	ProductDTO findproductdetail(@Param("companyid")String companyid, 
								@Param("category")String category, 
								@Param("category2")String category2, 
								@Param("flavor")String flavor);
	
	public void addCoupon(AllcouponDTO couponDTO);
}
