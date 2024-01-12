package test.spring.mvc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface Admin1Service{
	public int count();
	public void MemberList(int pageNum, Model model);
	public Member_basicDTO info(String id);
	public Member_detailDTO mem_info(String id);
	public int up_mem_info(Member_detailDTO dto, Member_basicDTO mb);
	public int NicCheck(String nic);
	public List<ProductDTO> best();
	public List<ProductDTO> best2();
	public void allcoupon(int pageNum, Model model);
	public int adminCheck(String couponid);
	public int adminCheck2(String couponid);
	public int alram();
	public List<AllcouponDTO> coupon(String id);
	public ProductimgDTO pro_img(String companyid, String category, String category2);
	public List<ProductDTO> discount();
	public int sale(int num);
}
