package test.spring.mvc.repository;

import test.spring.mvc.bean.AllcouponDTO;
<<<<<<< HEAD
=======
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
>>>>>>> branch 'main' of https://github.com/rladbwls1/dietfit.git

public interface SellerMapper {
	public void addCoupon(AllcouponDTO couponDTO);
	Member_basicDTO sellermodifyselect(@Param("id")String id,
										@Param("pw")String pw,
										@Param("name")String name,
										@Param("email")String email,
										@Param("nic")String nic);
}
