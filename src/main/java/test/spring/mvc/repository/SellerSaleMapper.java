package test.spring.mvc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.OrderdetailDTO;

public interface SellerSaleMapper {
	// ȸ�纰 �ֹ� ��ǰ���
	public List<OrderdetailDTO> orderproduct(String companyid);
	// �����ȣ ������Ʈ
	public void updateTrackingAndCourier(@Param("tracking") String tracking, 
			 							 @Param("courier") String courier,
			 							 @Param("orderid") String orderid, 
			 							 @Param("companyid") String companyid);
	// ȸ�纰 ����� �Ϸ� ������ �Ѵ�
	public Integer getTodaySales(@Param("companyid") String companyid);
	public Integer getWeeklySales(@Param("companyid") String companyid);
	public Integer getMonthlySales(@Param("companyid") String companyid);
	
	// ȸ�纰 ���� �����ݾ� �Ϸ� ������ �Ѵ�
	public Integer todayNetSales(@Param("companyid") String companyid);
	public Integer weeklyNetSales(@Param("companyid") String companyid);
	public Integer monthlyNetSales(@Param("companyid") String companyid);
	
	// �����ڿ��� �ִ� ������
	public Integer todayFee(@Param("companyid") String companyid);
	public Integer weeklyFee(@Param("companyid") String companyid);
	public Integer monthlyFee(@Param("companyid") String companyid);
}
