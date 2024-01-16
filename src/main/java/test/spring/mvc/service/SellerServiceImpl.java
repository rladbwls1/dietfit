package test.spring.mvc.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.DiscountDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.repository.SellerMapper;

@Service
public class SellerServiceImpl implements SellerService{

	@Autowired
	private SellerMapper mapper;
	
	@Autowired
	PasswordEncoder encoder;
	
	@Override
    public void addCoupon(AllcouponDTO couponDTO) {
        // 쿠폰 발행 요청을 처리하기 전에 admincheck 기본값 설정
        if (couponDTO.getAdmincheck() == 0) {
            couponDTO.setAdmincheck(0);
        }
        String uuid = UUID.randomUUID().toString();
        couponDTO.setCouponid(uuid);
        // 쿠폰 발행 요청을 저장하고, 관리자에게 알림 (예: DB에 저장)
        mapper.addCoupon(couponDTO);
    }

	@Override
	public void sellermodifyupdate(Member_basicDTO Member_basicDTO) {
		if(Member_basicDTO.getPw() != null&&!Member_basicDTO.getPw().equals("")) {
			Member_basicDTO.setPw(encoder.encode(Member_basicDTO.getPw()));
		}
		mapper.sellermodifyupdate(Member_basicDTO);
	}
	
//	@Override
//	public ProductDTO findproductdetail(String companyid, String category, String category2, String flavor) {
//		
//		return mapper.findproductdetail(companyid, category, category2, flavor);
//	}

	@Override
	public String findcompanyid(String id) {
		
		return mapper.findcompanyid(id);
	}

	@Override
	public Member_basicDTO sellermodifyselect(String id) {
		return mapper.sellermodifyselect(id);
	}

	@Override
	public void sellerwithdraw(String id) {
		mapper.sellerwithdraw(id);
	}

	@Override
	public int findstatus(String id) {
		return mapper.findstatus(id);
	}

	@Override
	public List<ProductDTO> getCompanyProduct(String id) {
	    String companyId = mapper.findcompanyid(id);
	    if (companyId != null) {
	        return mapper.findcompanyproduct(companyId);
	    }
	    return null;
	}

	@Override
	public void updatediscount(DiscountDTO discountDTO) {
		mapper.updatediscount(discountDTO);
	}

	@Override
	public ProductDTO sellerstockselect(String productId) {
		return mapper.sellerstockselect(productId);
	}

	@Override
	public void sellerstockupdate(ProductDTO productdto) {
		mapper.sellerstockupdate(productdto);
	}


}
