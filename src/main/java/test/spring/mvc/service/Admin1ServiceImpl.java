package test.spring.mvc.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

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
	
}
