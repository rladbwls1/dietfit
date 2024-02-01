package test.spring.mvc.service;

import java.util.List;


import test.spring.mvc.bean.OrderdetailDTO;

public interface SellerSaleService {
	
	// 회사별 상품 주문 목록 + 상품 이름
	public List<OrderdetailDTO> orderproduct(String companyid);
	
	// 송장번호 택배사 업데이트
	public void updateTrackingAndCourier(String tracking,  String courier, String orderid, String companyid);
	
	// 회사별 매출액 하루 일주일 한달
	public Integer getTodaySales(String companyid);
	public Integer getWeeklySales(String companyid);
	public Integer getMonthlySales(String companyid);
	
	// 회사별 순수 매출액 하루 일주일 한달
	public Integer todayNetSales(String companyid);
	public Integer weeklyNetSales(String companyid);
	public Integer monthlyNetSales(String companyid);
	
	// 회사별 순수 매출액 하루 일주일 한달
	public Integer todayFee(String companyid);
	public Integer weeklyFee(String companyid);
	public Integer monthlyFee(String companyid);
	

}
