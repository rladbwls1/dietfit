package test.spring.mvc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.CommercailDTO;
import test.spring.mvc.bean.OrderdetailDTO;

public interface SellerSaleMapper {
	// 회사별 주문 상품목록
	public List<OrderdetailDTO> orderproduct(@Param("companyid") String companyid, @Param("memberid") String memberid);
	
	// 송장번호 업데이트
	public void updateTrackingAndCourier(@Param("tracking") String tracking, 
			 					      @Param("courier") String courier,
			 					      @Param("orderid") String orderid, 
			 						  @Param("companyid") String companyid,
			 						 @Param("memberid") String memberid);
	// 회사별 매출액 하루 일주일 한달
	public Integer getTodaySales(@Param("companyid") String companyid);
	public Integer getWeeklySales(@Param("companyid") String companyid);
	public Integer getMonthlySales(@Param("companyid") String companyid);
	
	// 회사별 매출 순수금액 하루 일주일 한달
	public Integer todayNetSales(@Param("companyid") String companyid);
	public Integer weeklyNetSales(@Param("companyid") String companyid);
	public Integer monthlyNetSales(@Param("companyid") String companyid);
	
	// 관리자에게 주는 수수료
	public Integer todayFee(@Param("companyid") String companyid);
	public Integer weeklyFee(@Param("companyid") String companyid);
	public Integer monthlyFee(@Param("companyid") String companyid);
	
	// 회사별 잘팔리는 상품 하루 일주일 한달
	public List<OrderdetailDTO> dailySalesRank(@Param("companyid") String companyid);
	public List<OrderdetailDTO> weeklySalesRank(@Param("companyid") String companyid);
	public List<OrderdetailDTO> monthlySalesRank(@Param("companyid") String companyid);
	public List<OrderdetailDTO> allSalesRank(@Param("companyid") String companyid);
	
	// 광고 신청 
	public void insertCommercial(CommercailDTO commercial);
	
	// 광고 신청내역
	public List<CommercailDTO> selectcommercial(String companyid);
	
	// 광고 취소
	public void commdelect (@Param("num") int num);
	
	// 광고 내역서
	public CommercailDTO commercial(@Param("num") int num);
	
	// 광고 수정
	public int commupdate(CommercailDTO cdto);
	
	// 전체 회원
	public List<String> allmember();
}