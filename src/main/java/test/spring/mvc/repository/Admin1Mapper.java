package test.spring.mvc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.SaleDTO;

public interface Admin1Mapper {
	public Member_detailDTO mem_info(String id);
	public int up_mem_info(Member_detailDTO dto);
	public List<SaleDTO> best();
	public List<AllcouponDTO> allcoupon(@Param("start")int start, @Param("end")int end);
	public int allcoupon_count();
	public int adminCheck(String couponid);
	public int adminCheck2(String couponid);
	public int alram();
}
