package test.spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.spring.mvc.bean.OrderdetailDTO;
import test.spring.mvc.repository.SellerSaleMapper;

@Service
public class SellerSaleServiceImpl implements SellerSaleService{
	
	@Autowired
	private SellerSaleMapper sellermapper;

	@Override
	public List<OrderdetailDTO> orderproduct(String companyid) {
		return sellermapper.orderproduct(companyid);
	}

	@Override
	public void updateTrackingAndCourier(String tracking, String courier ,String orderid, String companyid) {
		companyid+="%";
		sellermapper.updateTrackingAndCourier( tracking, courier ,orderid, companyid );
	}

	@Override
	public Integer  getTodaySales(String companyid) {
		companyid+="%";
		System.out.println(companyid);
		return sellermapper.getTodaySales(companyid);
	}

	@Override
	public Integer  getWeeklySales(String companyid) {
		companyid+="%";
		return sellermapper.getWeeklySales(companyid);
	}

	@Override
	public Integer  getMonthlySales(String companyid) {
		companyid+="%";
		return sellermapper.getMonthlySales(companyid);
	}

	@Override
	public Integer todayNetSales(String companyid) {
		companyid+="%";
		return sellermapper.todayNetSales(companyid);
	}

	@Override
	public Integer weeklyNetSales(String companyid) {
		companyid+="%";
		return sellermapper.weeklyNetSales(companyid);
	}

	@Override
	public Integer monthlyNetSales(String companyid) {
		companyid+="%";
		return sellermapper.monthlyNetSales(companyid);
	}

	@Override
	public Integer todayFee(String companyid) {
		companyid+="%";
		return sellermapper.todayFee(companyid);
	}

	@Override
	public Integer weeklyFee(String companyid) {
		companyid+="%";
		return sellermapper.weeklyFee(companyid);
	}

	@Override
	public Integer monthlyFee(String companyid) {
		companyid+="%";
		return sellermapper.monthlyFee(companyid);
	}

}
