package test.spring.mvc.service;

import java.util.Collections;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.repository.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private EmailService eservice;
	 
	@Autowired
	private AdminMapper mapper;
	
	@Override
	public int companycount() {
		return mapper.companycount();
	}

	@Override
	public void companyList(int pageNum, Model model) {
		int companycount = mapper.companycount();
		List<Member_basicDTO> companyList = Collections.EMPTY_LIST;
		companyList = mapper.companyList();
		
		int pageSize = 3;
		int pageCount = companycount / pageSize + ( companycount % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(pageNum/10)*10+1;
		int pageBlock=3;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) {
        	endPage = pageCount;
        }
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("startPage", startPage);
        model.addAttribute("pageBlock", pageBlock);
        model.addAttribute("endPage", endPage);
        
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

	@Override
	public int allProductcount() {
		return mapper.allProductcount();
	}

	@Override
	public void allProduct(int pageNum, Model model) {
		int allProductcount = mapper.allProductcount();
		List<ProductDTO> allProduct = Collections.EMPTY_LIST;
		allProduct = mapper.allProduct();
	
		model.addAttribute("allProduct", allProduct);
		model.addAttribute("allProductcount", allProductcount);
	}
	
	@Override
	public int productcount() {
		return mapper.productcount();
	}
	
	@Override
	public void productList(int pageNum, Model model, String companyid) {
		int productcount = mapper.productcount();
		List<ProductDTO> productList = Collections.EMPTY_LIST;
		productList = mapper.productList(companyid);
		
        
		model.addAttribute("productList", productList);
		model.addAttribute("productcount", productcount);
	}

	@Override
	@Scheduled(cron = "0 0 10 * * ?")
	public void checkStock() {
		List<ProductDTO> allProduct = mapper.allProduct();
		for(ProductDTO product : allProduct) {
			int stock = mapper.getProductStock(product.getProduct());
			
			if(stock < 20) {
				try {
					eservice.sendMail(product.getCompanyid(), product.getCategory(), product.getCategory2(), product.getFlavor());
				} catch (MessagingException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void getProductName(String companyid, String category, String category2, String flavor, Model model) {
		String productName = mapper.getProductName(companyid, category, category2, flavor);
		model.addAttribute("productName", productName);
		model.addAttribute("companyid", companyid);
	}
	

	@Override
	public void getProductStock(String product, Model model) {
		int stock = mapper.getProductStock(product);
		model.addAttribute("stock", stock);
	}

	@Override
	public String getCompanyEmail(String companyid) {
		return mapper.getCompanyEmail(companyid);
	}

	
}
