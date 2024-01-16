package test.spring.mvc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface Admin1Mapper {
	public Member_detailDTO mem_info(String id);
	public int up_mem_info(Member_detailDTO dto);
	public List<ProductDTO> best();
	public List<ProductDTO> best2();
	public List<AllcouponDTO> allcoupon(@Param("start")int start, @Param("end")int end);
	public int allcoupon_count();
	public int adminCheck(String couponid);
	public int adminCheck2(String couponid);
	public int alram();
	public List<AllcouponDTO> coupon(String id);
	public ProductimgDTO pro_img(@Param("companyid")String companyid, @Param("category")String category,
			@Param("category2")String category2);
	public List<ProductDTO> discount();
	public int sale(int num);
	public List<ProductDTO> reco();
}
