package test.spring.mvc.service;


import test.spring.mvc.bean.AllcouponDTO;
<<<<<<< HEAD
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
=======
>>>>>>> branch 'main' of https://github.com/rladbwls1/dietfit.git

public interface SellerService {
    
    void addCoupon(AllcouponDTO couponDTO);
    public String findcompanyid(String id);
    public int findstatus(String id);
    Member_basicDTO sellermodifyselect(String id);
    public void sellermodifyupdate(Member_basicDTO Member_basicDTO);
    public void sellerwithdraw(String id);
}
