package test.spring.mvc.service;


import java.util.List;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.DiscountDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface SellerService {
    
    void addCoupon(AllcouponDTO couponDTO);
    public String findcompanyid(String id);
    public List<ProductDTO> getCompanyProduct(String id);
    public int findstatus(String id);
    Member_basicDTO sellermodifyselect(String id);
    public void sellermodifyupdate(Member_basicDTO Member_basicDTO);
    public void sellerwithdraw(String id);
    public void updatediscount(DiscountDTO discountDTO);
    public ProductDTO sellerstockselect(String productId);
    public void sellerstockupdate(ProductDTO productdto);
}
