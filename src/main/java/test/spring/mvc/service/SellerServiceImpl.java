package test.spring.mvc.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<ProductDTO> findallproductbycompanyid(String companyid) {
		return mapper.findallproductbycompanyid(companyid);
	}

	@Override
	public List<ProductimgDTO> findthumimg(String companyid, String category, String category2, String flavor) {
		Map<String, Object> params = new HashMap<>();
	    params.put("companyid", companyid);
	    params.put("category", category);
	    params.put("category2", category2);
	    params.put("flavor", flavor);
	    return mapper.findthumimg(params);
	}

	@Override
    public void addCoupon(AllcouponDTO couponDTO) {
        // 쿠폰 발행 요청을 처리하기 전에 admincheck 기본값 설정
        if (couponDTO.getAdmincheck() == 0) {
            couponDTO.setAdmincheck(0);
        }

        // 쿠폰 발행 요청을 저장하고, 관리자에게 알림 (예: DB에 저장)
        mapper.addCoupon(couponDTO);
    }

	@Override
	public ProductDTO findproductdetail(String companyid, String category, String category2, String flavor) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
}
