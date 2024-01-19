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

}
