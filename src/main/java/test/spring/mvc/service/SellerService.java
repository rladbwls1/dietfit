package test.spring.mvc.service;

import java.util.List;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface SellerService {
    
    List<ProductDTO> findallproductbycompanyid(String companyid);
    List<ProductimgDTO> findthumimg(String companyid, String category, String category2, String flavor);
    ProductDTO findproductdetail(String companyid, String category, String category2, String flavor);
    
    void addCoupon(AllcouponDTO couponDTO);
}
