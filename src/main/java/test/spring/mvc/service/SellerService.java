package test.spring.mvc.service;
import java.util.Date;
import java.util.List;
import org.springframework.ui.Model;
import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.ChatDTO;
import test.spring.mvc.bean.ChatreportDTO;
import test.spring.mvc.bean.DiscountDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.ProductDTO;

public interface SellerService {
    
    void addCoupon(AllcouponDTO couponDTO);
    public int chatroomnum(ChatDTO chatDTO, Model model,String id, String product, String companyid);
    public String findcompanyid(String id);
    public String findcompanyidbyproductid(String companyid);
    public List<ChatDTO> findnotreadchat(int readcheck,String companyid);
    public List<ProductDTO> getCompanyProduct(String id);
    Member_basicDTO sellermodifyselect(String id);
    public void sellermodifyupdate(Member_basicDTO Member_basicDTO);
    public void sellerwithdraw(String id);
    public void updatediscount(DiscountDTO discountDTO);
    public ProductDTO sellerstockselect(String productId);
    public void sellerstockupdate(ProductDTO productdto);
    public String findallbyroomnum(int roomnum);
    public String findidbyroomnum(int roomnum);
    public void endchat(int roomnum);
    public void chatreport(ChatreportDTO chatreportdto);
    public void chatreportdelete(int roomnum);
    public String findproductbycompanyid(String product);
    public List<DiscountDTO> findDiscountInfoByNum(int num);
    public void deletediscount();
    public void update2discount(DiscountDTO discountDTO);
    boolean checkDuplicateDiscount(String num);
}
