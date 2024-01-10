package test.spring.mvc.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.repository.SellerMapper;

@Service
public class SellerServiceImpl implements SellerService{

	@Autowired
	private SellerMapper mapper;
	
	@Override
    public void addCoupon(AllcouponDTO couponDTO) {
        // ���� ���� ��û�� ó���ϱ� ���� admincheck �⺻�� ����
        if (couponDTO.getAdmincheck() == 0) {
            couponDTO.setAdmincheck(0);
        }
        String uuid = UUID.randomUUID().toString();
        couponDTO.setCouponid(uuid);
        // ���� ���� ��û�� �����ϰ�, �����ڿ��� �˸� (��: DB�� ����)
        mapper.addCoupon(couponDTO);
    }
}
