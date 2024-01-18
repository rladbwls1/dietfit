package test.spring.mvc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.OrderdetailDTO;

public interface SellerSaleMapper {
	
	public List<OrderdetailDTO> orderproduct(String companyid);
	
	 public void updateTrackingAndCourier(@Param("tracking") String tracking, 
			 							  @Param("courier") String courier,
			 							  @Param("orderid") String orderid, 
			 							  @Param("companyid") String companyid);
}
