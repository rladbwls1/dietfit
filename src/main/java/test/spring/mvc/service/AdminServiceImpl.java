package test.spring.mvc.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.repository.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper mapper;
	
	@Override
	public int companycount() {
		return mapper.companycount();
	}

	@Override
	public void companyList(Model model) {
		int companycount = mapper.companycount();
		List<Member_basicDTO> companyList = Collections.EMPTY_LIST;
		companyList = mapper.companyList();
		model.addAttribute("companyList", companyList);
		model.addAttribute("companycount", companycount);
		
	}

	@Override
	public Member_basicDTO companyBasic(String id) {
		return mapper.companyBasic(id);
	}

	@Override
	public Member_detailDTO companyDetail(String id) {
		return mapper.companyDetail(id);
	}

	@Override
	public void companyStatus(String id, String status) {
		mapper.companyStatus(id, status);
	}

	
}
