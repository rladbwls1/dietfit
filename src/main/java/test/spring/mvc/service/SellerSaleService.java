package test.spring.mvc.service;

import java.util.List;

import test.spring.mvc.bean.OrderdetailDTO;

public interface SellerSaleService {
	
	// ȸ�纰 ��ǰ �ֹ� ���
	public List<OrderdetailDTO> orderproduct(String companyid);
	
	// �����ȣ �ù�� ������Ʈ
	public void updateTrackingAndCourier(  String tracking,  String courier, String orderid, String companyid);
}
