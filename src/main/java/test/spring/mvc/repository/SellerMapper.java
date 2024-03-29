package test.spring.mvc.repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.ChatDTO;
import test.spring.mvc.bean.ChatreportDTO;
import test.spring.mvc.bean.DiscountDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface SellerMapper {
	public void addCoupon(AllcouponDTO couponDTO);
	public void chatroomnum(ChatDTO chatDTO);
	Member_basicDTO sellermodifyselect(@Param("id")String id,
										@Param("pw")String pw,
										@Param("name")String name,
										@Param("email")String email,
										@Param("nic")String nic);
	public String findcompanyid(String id);
	public String findcompanyidbyproductid(String companyid);
	public List<ProductDTO> findcompanyproduct(@Param("companyid")String companyid);
	public List<ChatDTO> findnotreadchat(int readcheck,@Param("companyid")String companyid);
	public Member_basicDTO sellermodifyselect(String id);
	public void sellermodifyupdate(Member_basicDTO Member_basicDTO);
	public void sellerwithdraw(String id);
	public void updatediscount(DiscountDTO discountDTO);
	public ProductDTO sellerstockselect(String productId);
	public void sellerstockupdate(ProductDTO productdto);
	public String countidchat(@Param("id")String id,
							@Param("product")String product);
    public String findallbyroomnum(int roomnum);
    public String findidbyroomnum(int roomnum);
    public void endchat(int roomnum);
    public void chatreport(ChatreportDTO chatreportdto);
    public void chatreportdelete(int roomnum);
    public List<ProductDTO> memberproductall();
    public String findproductbycompanyid(String product);
    public List<DiscountDTO> findDiscountInfoByNum(int num);
    public void deletediscount();
    public void update2discount(DiscountDTO discountDTO);
    public int countByNum(@Param("num") String num);
}
