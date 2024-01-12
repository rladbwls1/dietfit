package test.spring.mvc.repository;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface SellerMapper {
	public void addCoupon(AllcouponDTO couponDTO);
	Member_basicDTO sellermodifyselect(@Param("id")String id,
										@Param("pw")String pw,
										@Param("name")String name,
										@Param("email")String email,
										@Param("nic")String nic);
	public String findcompanyid(String id);
	public int findstatus(String id);
	public Member_basicDTO sellermodifyselect(String id);
	public void sellermodifyupdate(Member_basicDTO Member_basicDTO);
	public void sellerwithdraw(String id);
}
