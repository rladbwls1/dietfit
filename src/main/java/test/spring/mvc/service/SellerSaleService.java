package test.spring.mvc.service;

import java.util.List;


import test.spring.mvc.bean.OrderdetailDTO;

public interface SellerSaleService {
	
	// ȸ�纰 ��ǰ �ֹ� ��� + ��ǰ �̸�
	public List<OrderdetailDTO> orderproduct(String companyid);
	
	// �����ȣ �ù�� ������Ʈ
	public void updateTrackingAndCourier(String tracking,  String courier, String orderid, String companyid);
	
	// ȸ�纰 ����� �Ϸ� ������ �Ѵ�
	public Integer getTodaySales(String companyid);
	public Integer getWeeklySales(String companyid);
	public Integer getMonthlySales(String companyid);
	
	// ȸ�纰 ���� ����� �Ϸ� ������ �Ѵ�
	public Integer todayNetSales(String companyid);
	public Integer weeklyNetSales(String companyid);
	public Integer monthlyNetSales(String companyid);
	
	// ȸ�纰 ���� ����� �Ϸ� ������ �Ѵ�
	public Integer todayFee(String companyid);
	public Integer weeklyFee(String companyid);
	public Integer monthlyFee(String companyid);
	

}
