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

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
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
	public void up_mem_info(Member_detailDTO dto) {
		System.out.println("aaaaaaaaa");
		mapper.up_mem_info(dto);
	}
}
