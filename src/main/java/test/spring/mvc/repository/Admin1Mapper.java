package test.spring.mvc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.CommercailDTO;
import test.spring.mvc.bean.DiscountDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.bean.ProductinfoDTO;

public interface Admin1Mapper {
	public Member_detailDTO mem_info(String id);
	public int up_mem_info(Member_detailDTO dto);
	public List<ProductDTO> best();
	public List<ProductDTO> best2();
	public List<AllcouponDTO> allcoupon(@Param("start")int start, @Param("end")int end);
	public int allcoupon_count();
	public int adminCheck(String couponid);
	public int adminCheck2(String couponid);
	public int alram();
	public List<AllcouponDTO> coupon(String id);
	public ProductimgDTO pro_img(@Param("companyid")String companyid, @Param("category")String category,
			@Param("category2")String category2);
	public List<ProductDTO> discount();
	public int sale(int num);
	public List<ProductDTO> reco();
	public List<ProductinfoDTO> food(@Param("minkcal")int minkcal, @Param("maxkcal")int maxkcal, @Param("category")List<Integer>category);
	public List<ProductinfoDTO> meal();
	public List<ProductinfoDTO> meal_replace();
	public List<ProductDTO> food_product(String productid);
	//장바구니에 이미 있는 상품인지 확인
	public int isCart(@Param("id")String id, @Param("product") String product);
	//장바구니에 하나의 상품 추가
	public void addCartOne(@Param("id")String id, @Param("product") String product, 
				@Param("quantity")int quantity, @Param("price")int price, @Param("delivery")int delivery);
	public ProductDTO Productid(String productid);
	public void rdCart(@Param("id")String id, @Param("delivery") int delivery, 
			@Param("num")int num);
	public List<CommercailDTO> comm();
	public int commCheck(@Param("admincheck")int admincheck, @Param("num") int num);
	public List<DiscountDTO> discountNum();
}
