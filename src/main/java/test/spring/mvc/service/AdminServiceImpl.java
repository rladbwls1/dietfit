package test.spring.mvc.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;
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
	public void companyList(Model model) {
		int companycount = mapper.companycount();
		List<Member_basicDTO> companyList = Collections.EMPTY_LIST;
		companyList = mapper.companyList();
		
//		int pageSize = 3;
//		int pageCount = companycount / pageSize + ( companycount % pageSize == 0 ? 0 : 1);
//		 
//        int startPage = (int)(pageNum/10)*10+1;
//		int pageBlock=3;
//        int endPage = startPage + pageBlock-1;
//        if (endPage > pageCount) {
//        	endPage = pageCount;
//        }
//        model.addAttribute("pageCount", pageCount);
//        model.addAttribute("startPage", startPage);
//        model.addAttribute("pageBlock", pageBlock);
//        model.addAttribute("endPage", endPage);
        
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
	public void companyStatus(String status, String id) {
		mapper.companyStatus(status, id);
	}

	@Override
	public String getLastCompanyId() {
		return mapper.getLastCompanyId();
	}
	
	@Override
	public String getCompanyId(String id) {
		return mapper.getCompanyId(id);
	}
	
	@Override
	public String generateCompanyId(String companyid, String id) {
	    String lastCompanyId = mapper.getLastCompanyId();

		    if (lastCompanyId == null || lastCompanyId.isEmpty()) {
		        return "AA";
		    }
	
		    char[] chars = lastCompanyId.toCharArray();
	
		    // 현재 "AZ"까지 사용된 경우
		    if (chars[1] == 'Z') {
		        chars[0]++; // 첫 번째 문자를 다음 알파벳으로 이동
		        chars[1] = 'A'; // 두 번째 문자를 'A'로 설정
		    } else {
		        chars[1]++; // 두 번째 문자를 다음 알파벳으로 이동
		    }
	
		    String newCompanyId = new String(chars);
		    mapper.generateCompanyId(newCompanyId, id);
	    
	    return newCompanyId;
	}

	@Override
	public int allProductcount() {
		return mapper.allProductcount();
	}

	@Override
	public void allProduct(Model model) {
		int allProductcount = mapper.allProductcount();
		List<ProductDTO> allProduct = Collections.EMPTY_LIST;
		allProduct = mapper.allProduct();
	
		model.addAttribute("allProduct", allProduct);
		model.addAttribute("allProductcount", allProductcount);
	}
	
	@Override
	public int stocklesscount(int stock) {
		return mapper.stocklesscount(stock);
	}
	
	@Override
	public void stockless(Model model, int stock) {
		int stocklesscount = mapper.stocklesscount(stock);
		List<ProductDTO> stockless = Collections.EMPTY_LIST;
		stockless = mapper.stockless(stock);
		
		model.addAttribute("stocklesscount", stocklesscount);
		model.addAttribute("stockless", stockless);
	}
	
	@Override
	public void checkstock(String product) {
		for(String productname:product.split(",")) {
				try {
					String companyid = mapper.getCompanyid(productname);
					String category = mapper.getCategory(productname);
					String category2 = mapper.getCategory2(productname);
					String flavor = mapper.getFlavor(productname);
					eservice.sendMail(companyid, category, category2, flavor);
				} catch (MessagingException e) {
					e.printStackTrace();
				}
			}
		
	}
	
//	@Override
//	@Scheduled(cron = "0 0 10 * * ?")
//	public void checkStock() {
//		List<ProductDTO> allProduct = mapper.allProduct();
//		for(ProductDTO product : allProduct) {
//			int stock = mapper.getProductStock(product.getProduct());
//			
//			if(stock < 20) {
//				try {
//					eservice.sendMail(product.getCompanyid(), product.getCategory(), product.getCategory2(), product.getFlavor());
//				} catch (MessagingException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//	}

	@Override
	public int productcount(String companyid) {
		return mapper.productcount(companyid);
	}
	
	@Override
	public void productList(Model model, String companyid) {
		int productcount = mapper.productcount(companyid);
		List<ProductDTO> productList = Collections.EMPTY_LIST;
		productList = mapper.productList(companyid);
		model.addAttribute("productList", productList);
		model.addAttribute("productcount", productcount);
	}


	@Override
	public void getProductName(String companyid, String category, String category2, String flavor, Model model) {
		String productName = mapper.getProductName(companyid, category, category2, flavor);
		model.addAttribute("productName", productName);
		model.addAttribute("companyid", companyid);
	}
	

//	@Override
//	public void getProductStock(String product, Model model) {
//		int stock = mapper.getProductStock(product);
//		model.addAttribute("stock", stock);
//	}

	@Override
	public String getCompanyEmail(String companyid) {
		return mapper.getCompanyEmail(companyid);
	}

	

	

	
	
}
