package test.spring.mvc.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import test.spring.mvc.bean.AllcouponDTO;
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
	public List<ProductinfoDTO> food(int minkcal, int maxkcal, Model model, List<Integer> category) {
		System.out.println("category-----------"+category);
		List<ProductinfoDTO> list = mapper.food(minkcal, maxkcal, category);
		int check = 0;
//		List<ProductinfoDTO> fo = new ArrayList<>();
//		fo.addAll(list);
		 if (list.isEmpty()) {
//			 System.out.println("------------------------------------------");
			 check = 1;
			 model.addAttribute("check", check);
			 list = mapper.food((minkcal/2), (maxkcal/2), category);
			 List<List<ProductDTO>> groupedList = new ArrayList<>();
			 List<ProductDTO> list2 = new ArrayList<>();
			 List<ProductDTO> re = new ArrayList<>();
				 for(ProductinfoDTO f : list) {
					 list2 = mapper.food_product(f.getProductid());
					 re.addAll(list2);
				 }
				 Collections.shuffle(re);
					 for(int i = 0; i < re.size(); i += 2) {
				            List<ProductDTO> pair = new ArrayList<>();
				            pair.add(re.get(i));
				            if (i + 1 < re.size()) {
				                pair.add(re.get(i + 1));
				            }
				            groupedList.add(pair);
				            model.addAttribute("list2", groupedList);
				        }
			 if(list.isEmpty()) {
				 // 해당 상품이 존재하지 않습니다.
			 }
		 }
//		        Random random = new Random();
//		        int randomIndex = random.nextInt(list.size()); // 랜덤 인덱스 생성
//		        ProductinfoDTO randomProduct = list.get(randomIndex); // 랜덤으로 선택된 항목 가져오기
//		        fo.add(randomProduct);
//		    }
//			ProductinfoDTO rmeal = list.get(index);
//		List<ProductinfoDTO> meal = mapper.meal();
//		List<ProductinfoDTO> meal_replace = mapper.meal_replace();
//		if(list.isEmpty()) {
//			if(!(minkcal < rmeal.getKcal() && rmeal.getKcal() < maxkcal)) {
//				System.out.println("칼로리 부족");
//				                                                                                                                                                                                                                                                                                                                                                                            
//			}
//			 List<ProductinfoDTO> rmeals = new ArrayList<>();
//			 int totalKcal = 0;
//			    while (!(minkcal < totalKcal && totalKcal < maxkcal)) {
//			        int index = random.nextInt(meal.size());
//			        ProductinfoDTO rmeal = meal.get(index);
//			        
//			        if (!(minkcal < rmeal.getKcal() && rmeal.getKcal() < maxkcal)) {
//			            rmeals.add(rmeal);
//			            totalKcal += rmeal.getKcal();
//			        }
//			        
//			        if (minkcal < totalKcal && totalKcal < maxkcal) {
//			            System.out.println("칼로리 완성");
//			        }
//			        
//			    }
//			model.addAttribute("list", list);
//		}
		return list;
	}

	@Override
	public List<ProductDTO> food_product(String productid) {
		return mapper.food_product(productid);
	}
}
