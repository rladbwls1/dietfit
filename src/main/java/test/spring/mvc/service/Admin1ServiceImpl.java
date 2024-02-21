package test.spring.mvc.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.CommercailDTO;
import test.spring.mvc.bean.CouponDTO;
import test.spring.mvc.bean.DiscountDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.bean.ProductinfoDTO;
import test.spring.mvc.entity.Member_basicEntity;
import test.spring.mvc.repository.Admin1Mapper;
import test.spring.mvc.repository.AdminJPARepository;

@Service
public class Admin1ServiceImpl implements Admin1Service{
	
	@Autowired
	private AdminJPARepository adminJPA;
	
	@Autowired
	private Admin1Mapper mapper;

	@Override
	public int count() {
		return (int)adminJPA.count();
	}

	@Override
	public void MemberList(int pageNum, Model model) {
		int pageSize = 10;
		int count = count();
		List<Member_basicDTO> list = Collections.EMPTY_LIST;
		if(count > 0) {
			Sort sort = Sort.by(Sort.Direction.ASC, "num");
			
			Page<Member_basicEntity> page = adminJPA.findAll(PageRequest.of(pageNum-1, pageSize, sort));
			List<Member_basicEntity> enList = page.getContent();
			
			list = new ArrayList<>();
			for(Member_basicEntity mb : enList) {
				Member_basicDTO dto = mb.toM_basicDTO();
				list.add(dto);
			}
		}
		model.addAttribute("memberlist", list);
		model.addAttribute("count",count);
	    model.addAttribute("pageNum",pageNum);
	    model.addAttribute("pageSize",pageSize);
	    
	    //page
	    int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(pageNum/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) {
			endPage = pageCount;
        }				
        model.addAttribute("pageCount",pageCount);
        model.addAttribute("startPage",startPage);
        model.addAttribute("pageBlock",pageBlock);
        model.addAttribute("endPage",endPage);
	}

	@Override
	public Member_basicDTO info(String id) {
		return adminJPA.findById(id).get().toM_basicDTO();
	}

	@Override
	public Member_detailDTO mem_info(String id) {
		return mapper.mem_info(id);
	}

	@Override
	public int up_mem_info(Member_detailDTO dto ,Member_basicDTO mb) {
		int result1 = mapper.up_mem_info(dto);
		int result2 = adminJPA.up_mem_basic(mb);
		return result1 + result2;
	}

	@Override
	public int NicCheck(String nic) {
		System.out.println(nic);
		int check = adminJPA.NicCheck(nic);
		return check;
	}

	@Override
	public List<ProductDTO> best() {
		return mapper.best();
	}

	@Override
	public void allcoupon(int pageNum, Model model) {
		int pageSize = 10;
		int count = mapper.allcoupon_count();
		//page
		int startRow = (pageNum - 1) * pageSize + 1;
		int endRow = pageNum * pageSize;
	    int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(pageNum/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) {
			endPage = pageCount;
        }				
		List<AllcouponDTO> list = Collections.EMPTY_LIST;
		if(count > 0) {
			list = mapper.allcoupon(startRow, endRow);
		}
		model.addAttribute("couponlist", list);
		model.addAttribute("count",count);
	    model.addAttribute("pageNum",pageNum);
	    model.addAttribute("pageSize",pageSize);
	    
        model.addAttribute("pageCount",pageCount);
        model.addAttribute("startPage",startPage);
        model.addAttribute("pageBlock",pageBlock);
        model.addAttribute("endPage",endPage);
	}

	@Override
	public int adminCheck(String couponid) {
		return mapper.adminCheck(couponid);
	}

	@Override
	public int adminCheck2(String couponid) {
		return mapper.adminCheck2(couponid);
	}

	@Override
	public int alram() {
		return mapper.alram();
	}

	@Override
	public List<AllcouponDTO> coupon(String id) {
		return mapper.coupon(id);
	}

	@Override
	public ProductimgDTO pro_img(String companyid, String category, String category2) {
		return mapper.pro_img(companyid, category, category2);
	}

	@Override
	public List<ProductDTO> best2() {
		return mapper.best2();
	}
	
	@Override
	public List<ProductDTO> discount() {
		return mapper.discount();
	}

	@Override
	public int sale(int num) {
		return mapper.sale(num);
	}

	@Override
	public List<ProductDTO> reco() {
		return mapper.reco();
	}
	// 식단 아침, 점심, 저녁 (칼로리만)
	@Override
	public List<ProductinfoDTO> food(int minkcal, int maxkcal, Model model, List<Integer> category, HttpServletRequest request) {
		System.out.println("category-----------"+category);
		List<ProductinfoDTO> list = mapper.food(minkcal, maxkcal, category);
		int check = 0;
//		List<ProductinfoDTO> fo = new ArrayList<>();
//		fo.addAll(list);
		 if (list.isEmpty()) {
//			 System.out.println("------------------------------------------");
			 check = 1;
			 list = mapper.food((minkcal/2), (maxkcal/2), category);
			 
//			 List<List<ProductDTO>> groupedList = new ArrayList<>();
//			 List<ProductDTO> list2 = new ArrayList<>();
//			 List<ProductDTO> re = new ArrayList<>();
//				 for(ProductinfoDTO f : list) {
//					 list2 = mapper.food_product(f.getProductid());
//					 re.addAll(list2);
//				 }
//				 Collections.shuffle(re); // 리스트 순서 랜덤 코드
//					 for(int i = 0; i < re.size(); i += 2) {
//				            List<ProductDTO> pair = new ArrayList<>();
//				            pair.add(re.get(i));
//				            if (i + 1 < re.size()) {
//				                pair.add(re.get(i + 1));
//				            }
//				            groupedList.add(pair);
//				            List<ProductDTO> selectedPair = groupedList.get(0);
//				            model.addAttribute("list2", selectedPair);
//				        }
					 List<ProductinfoDTO> otfood = new ArrayList<>();
					 otfood.addAll(list);
//					 for(int i = 1; i < groupedList.size(); i++) {
//						 otfood.addAll(groupedList.get(i));
//					 }
//					 model.addAttribute("otfood", otfood);
					 request.setAttribute("check", check);
					 return otfood;
				 // 해당 상품이 존재하지 않습니다.
			 }else {
				 request.setAttribute("check", check);
				 return list;
		 }
	 }

	@Override
	public List<ProductDTO> food_product(String productid) {
		return mapper.food_product(productid);
	}
	
	public void addCartMore(String id, String products, int delivery) {
		for(String productid:products.split(",")) {
			ProductDTO pro = mapper.Productid(productid);
			String product = pro.getProduct();
			int price= Integer.parseInt(pro.getPrice());
			addCartOne(id,product,1,price, delivery);
		}
	}

	@Override
	public void addCartOne(String id, String product, int quantity, int price, int delivery) {
		int check=mapper.isCart(id, product);
		if(check==0) {
			mapper.addCartOne(id, product, quantity, price, delivery);
		}
	}

	@Override
	public void rdCart(String id, String num, int check) {
		for(String n : num.split(",")) {
			mapper.rdCart(id, check, Integer.parseInt(n));
		}
	}

	@Override
	public List<CommercailDTO> comm() {
		return mapper.comm();
	}

	@Override
	public int commCheck(int admincheck, int num) {
		return mapper.commCheck(admincheck, num);
	}

	@Override
	public List<DiscountDTO> discountNum() {
		return mapper.discountNum();
	}

	@Override
	public List<CouponDTO> Usercoupon(String id) {
		return mapper.Usercoupon(id);
	}

	@Override
	public List<Member_basicDTO> memberId() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
