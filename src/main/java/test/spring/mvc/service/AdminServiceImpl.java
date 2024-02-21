package test.spring.mvc.service;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import test.spring.mvc.bean.DeliveryDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.OrderdetailDTO;
import test.spring.mvc.bean.OrdersumDTO;
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
		int companycount800 = mapper.companycount800();
		int companycount888 = mapper.companycount888();
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
		model.addAttribute("companycount800", companycount800);
		model.addAttribute("companycount888", companycount888);
	}

	@Override
	public void memberList(Model model) {
		int membercount = mapper.membercount1();
		model.addAttribute("membercount", membercount);
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
	public void companyStatusR(String authority, String username) {
		mapper.companyStatusR(authority, username);
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

	@Override
	public String generateOrderId(Principal pri) {
        // 여기에서 주문 ID 생성 로직을 구현
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String datePart = dateFormat.format(new Date());

        String id = pri.getName();
        String orderId;
        boolean isDuplicate;
        
        do {
        	orderId = datePart + String.format("%04d", (int) (Math.random() * 10000));
        	isDuplicate = mapper.findOrderId(id, orderId) > 0;
        } while (isDuplicate);
        // 예시: 날짜 + 4자리 랜덤 숫자
        return orderId;
    }

	
	@Override
	public Map<String, Integer> findproductIdQuantity(String id, String nums) {
	    String[] numsArray = new String[0];
	    if (nums != null) {
	        numsArray = nums.split(",");
	    }
	    List<Integer> numsList = new ArrayList<>();
	    for (String num : numsArray) {
	        numsList.add(Integer.parseInt(num.trim()));
	    }

	    Map<String, Integer> productQuantities = new HashMap<>();
	    for (int productNum : numsList) {
	        String product = mapper.findproduct(id, productNum);
	        String productId = mapper.getProductId(product);
	        int quantity = mapper.findquantity(id, productNum); // 가정: getProductQuantity는 제품의 수량을 반환하는 메서드
	        productQuantities.put(productId, quantity);
	    }
	    return productQuantities;
	}

	
//	@Override
//	public List<String> findproductId(String id, String nums) {
//		String[] numsArray = new String[0];
//		if(nums != null) {
//			numsArray = nums.split(",");
//		}
//        List<Integer> numsList = new ArrayList<>();
//        for (String num : numsArray) {
//            numsList.add(Integer.parseInt(num.trim()));
//        }
//
//        List<String> productIds = new ArrayList<>();
//        for (int productNum : numsList) {
//            String product = mapper.findproduct(id, productNum);
//            String productId = mapper.getProductId(product);
//            productIds.add(productId);
//        }
//        return productIds;
//    }

	@Override
	public void createOrder(String id, OrderdetailDTO orderdetail) {
		mapper.memberOrderDetail(id, orderdetail);
	}

	
	@Override
	public void createOrderSum(OrdersumDTO ordersum) {
		mapper.orderSummary(ordersum);
	}

	
	@Override
	public void changeCoupon(String id, String couponid) {
		mapper.changeCounpon(id, couponid);
	}

	@Override
	public void createDelivery(String id, DeliveryDTO delivery) {
		mapper.memberDelivery(id, delivery);
	}

	@Override
	public int findprice(String productid) {
		return mapper.findPrice(productid);
	}


	
	//adminMain
	@Override
	public void commListC(Model model) {
		int commCount = mapper.commCount();
		model.addAttribute("commCount", commCount);
	}
	

	

	
	
	
	
}
