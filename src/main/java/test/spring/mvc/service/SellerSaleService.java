package test.spring.mvc.service;

import java.util.List;

import test.spring.mvc.bean.OrderdetailDTO;

public interface SellerSaleService {
	
	// 회사별 상품 주문 목록
	public List<OrderdetailDTO> orderproduct(String companyid);
	
	// 송장번호 택배사 업데이트
	public void updateTrackingAndCourier(  String tracking,  String courier, String orderid, String companyid);
}
