package test.spring.mvc.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.vertx.java.core.json.JsonObject;

import test.spring.mvc.bean.CouponDTO;
import test.spring.mvc.bean.DeliveryDTO;
import test.spring.mvc.bean.OrderdetailDTO;
import test.spring.mvc.bean.OrdersumDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductinfoDTO;
import test.spring.mvc.repository.AdminMapper;
import test.spring.mvc.repository.MemberMapper;
import test.spring.mvc.service.Admin1ServiceImpl;
import test.spring.mvc.service.AdminService;
import test.spring.mvc.service.MemberService;
import test.spring.mvc.service.SurveyService;

@Controller
@RequestMapping("/dietfit/*")
public class DietfitController {
	
	@Autowired
	private SurveyService service;
	
	@Autowired
	private AdminService aservice;
	
	@Autowired
	private Admin1ServiceImpl aservice1;
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private AdminMapper mapper;
	
	@Autowired
	private MemberMapper mmapper;
	
	@RequestMapping("main")
	public String main() {
		return "main";
	}
	
	@RequestMapping("contact")
	public String contact() {
		return "contact";
	}
	
	@RequestMapping("survey")
	public String survey() {
		return "admin/survey/form";
	}
	
	@RequestMapping("surveyResult")
	public String surveyResult(@RequestParam String gender,
			@RequestParam double height,
			@RequestParam double weight,
			@RequestParam int age,
			@RequestParam double activity, Model model) {
		
		double bmi = service.calculateBMI(height, weight);
		double bmr = service.calculateBMR(gender, weight, height, age);
		double tdee = service.calculateTDEE(bmr, activity);
		int tdeeAsInt = (int) tdee;
		
		model.addAttribute("bmi", bmi);
		model.addAttribute("bmr", bmr);
		model.addAttribute("tdeeAsInt", tdeeAsInt);
		
		int diettdee = 0;
				
		if(bmi <= 18.5) {
			diettdee = tdeeAsInt + 200;
		}else if(bmi > 18.5 && bmi <= 23){
			diettdee = tdeeAsInt;
		}else if(bmi > 23 && bmi <= 25) {
			diettdee = tdeeAsInt - 100;
		}else if(bmi > 25 && bmi <= 30) {
			diettdee = tdeeAsInt - 300;
		}else if(bmi >= 30) {
			diettdee = tdeeAsInt - 500;
		}
	
		int protein = service.needProtein(diettdee);
		int fat = service.needFat(diettdee);
		int rice = service.needRice(diettdee);

		
		model.addAttribute("diettdee", diettdee);
		model.addAttribute("protein", protein);
		model.addAttribute("fat", fat);
		model.addAttribute("rice", rice);
		return "admin/survey/result";
	}
	
	@RequestMapping("eat")
	public String eat(int kcal, Model model, HttpServletRequest request) {
		List<ProductinfoDTO> lists = new ArrayList<>();
		double [][] oper = {{0.2, 0.25}, {0.3, 0.35}, {0.25, 0.3}, {0.1, 0.15}};
		String [] menu = {"mo","br","de","se"};
		lists = new ArrayList<>();
		List<ProductDTO> result = new ArrayList<>();
		List<int[]> boundsList = new ArrayList<>();
		Random random = new Random();
		List<Integer> category = null;
// 간식		, {0.1, 0.15}
		for(int i = 0; i < oper.length; i++) {
			category = Arrays.asList(31, 32, 33, 34, 35, 36, 39, 41, 42, 43, 44);
			if(i < 3) {
				category = Arrays.asList(11, 12, 13, 14, 15, 21, 22, 23, 24, 26);
				System.out.println("11111111111111111");
			}
			System.out.println(menu[i]);
			String me = menu[i];
			System.out.println((int)(oper[i][0] * kcal));
			System.out.println((int)(oper[i][1] * kcal));

			List<ProductinfoDTO> food = aservice1.food((int)(oper[i][0] * kcal), (int)(oper[i][1] * kcal), model, category, request);
			lists.addAll(food);
			List<ProductDTO> re = new ArrayList<>();
			List<ProductDTO> aa = new ArrayList<>();
			int check = (int) request.getAttribute("check");
			for(ProductinfoDTO f: food) {
			   result = aservice1.food_product(f.getProductid());
			   re.addAll(result);
			}
			System.out.println("0000000000000000000000000"+re);
			if (!re.isEmpty()) { // 결과가 비어 있지 않을 때만 랜덤 선택 수행
				Collections.shuffle(re);
				ProductDTO pi = re.get(0);
				aa.add(pi);
				if(re.size() >= 2 && check == 1) {
					pi = re.get(1);
					aa.add(pi);
				}
            }
			model.addAttribute(me + "_minkcal", (int)(oper[i][0] * kcal));
			model.addAttribute(me + "_maxkcal", (int)(oper[i][1] * kcal));
			model.addAttribute(me +"_re", aa);
			model.addAttribute("list", lists);
			model.addAttribute("kcal", boundsList);
			System.out.println(me + "@@@@@@@@@@@@@@@@"+check);
			model.addAttribute(me+"_chk", check);
			System.out.println(me+"++++++++++++++++++++++++++++"+aa);
		}
		return "admin/eat";
	}
	
	@RequestMapping("order")
	public String order(Principal pri, String nums, Model model, Integer amout, Integer totalQuantity, String product,int delivery) {
		
		String orderid = aservice.generateOrderId(pri);
		model.addAttribute("delivery9", mapper.getUserDelivery9(pri.getName()));
		model.addAttribute("mypoint", mservice.getPoint(pri.getName()));
		model.addAttribute("nums",nums);
		model.addAttribute("orderid", orderid);
		model.addAttribute("amount", amout);
		model.addAttribute("quantity", totalQuantity);
		model.addAttribute("delivery", delivery);
		Integer taxfree = (int) ((Integer)amout*0.9);
		model.addAttribute("taxfree", taxfree);
		
		String[] numsArray = new String[0];
		if(nums != null) {
			numsArray = nums.split(",");
		}
        List<Map<String,Object>> cartList=new ArrayList<>();
        for (String num : numsArray) {
             cartList.add(mapper.getMyCart(pri.getName(), Integer.parseInt(num.trim())));
        }
        model.addAttribute("cartList",cartList);
        System.out.println(mapper.getUserDelivery9(pri.getName()));
        
        mservice.getCartList(model, pri.getName());
		return "admin/order";
	}
	
	@RequestMapping("orderDelivery")
	public String orderDelivery(Principal pri, Model model) {
		model.addAttribute("id",pri.getName());
		model.addAttribute("list",mmapper.getUserDelivery(pri.getName()));
		return "admin/orderDelivery";
	}
	
	@RequestMapping("getDelivery")
	public @ResponseBody DeliveryDTO getDelivery(String nicaddr,Principal pri) {
		DeliveryDTO dto=mapper.getDeliveryByNicaddr(pri.getName(), nicaddr);
		return dto;
	}
	
	@RequestMapping("myCouponList")
	public String myCouponList(Principal pri, Model model,String nums) {
		model.addAttribute("list", mapper.getUserCoupon(pri.getName()));
		
		String[] numsArray = new String[0];
		if(nums != null) {
			numsArray = nums.split(",");
		}
        ArrayList<Map<String, Object>> cartList = new ArrayList<>();
        for (String num : numsArray) {
             cartList.add(mapper.getMyCart(pri.getName(), Integer.parseInt(num.trim())));
        }
        model.addAttribute("cartList",cartList);
        
        //companyid 와 그에 따른 총 가격
        Map<String, Integer> companyPrice = new HashMap<String, Integer>();
        for (Map<String, Object> cartItem : cartList) {
            String companyId = (String) cartItem.get("COMPANYID");
            int price = Integer.parseInt(cartItem.get("PRICE").toString()) * Integer.parseInt(cartItem.get("QUANTITY").toString());
            if(companyPrice.containsKey(companyId)) {
        		//해당 회사 ID가 있는 경우에는 더해줌
            	
        		if (companyId != null && price!=0) {
        			companyPrice.put(companyId, companyPrice.get(companyId)+price);
        		}
            }else {
            	// 추출된 값이 null이 아닌지 확인 후, 맵에 추가
	            if (companyId != null && price!=0) {
	                companyPrice.put(companyId, price);
	            }
            }
        }
        model.addAttribute("companyPrice", companyPrice);
		return "admin/myCouponList";
	}
	
//	@RequestMapping("getCoupon")
//	public @ResponseBody String getCoupon(Principal pri, String coupon) {
//		String couponid = mapper.getCouponIdByCoupon(pri.getName(), coupon);
//		return couponid;
//	}
	
	@RequestMapping("kakaopaygo")
	public @ResponseBody String kakaopaygo(Principal pri, Model model, String nums,
			String address1, String address2, String postcode, String phone, String nicaddr, String receiver,
			String couponid, int usepoint, int coupondiscount,
			@RequestParam String partner_order_id,
	        @RequestParam String partner_user_id,
	        @RequestParam String item_name,
	        @RequestParam Integer quantity,
	        @RequestParam Integer total_amount,
	        @RequestParam Integer tax_free_amount,
	        @RequestParam String chk_info) {
		//결제과정에서 null인경우 결제가 이루어지면 안되기 때문에 int가 아니라 Integer,
		//int는 null을 허용하지 않지만, Integer은 null을 허용함
		
		//orderdetail DTO 저장
		String id = pri.getName();
		String orderid = partner_order_id;
		
		try {
			Map<String, Integer> productQuantities = aservice.findproductIdQuantity(id, nums);

			// 맵에서 제품 ID를 가져와서 주문 상세를 생성
			for (Map.Entry<String, Integer> entry : productQuantities.entrySet()) {
			    String productId = entry.getKey();
			    Integer productquantity = entry.getValue();
			    
				OrderdetailDTO orderdetail = new OrderdetailDTO();
				orderdetail.setOrderid(orderid);
				orderdetail.setPurdate(new Date());
				orderdetail.setQuantity(productquantity);
				orderdetail.setPrice(aservice.findprice(productId));
				orderdetail.setDelivery(0); //if문으로 정기배송일 시 1, 아닐시 0으로 수정
				
				//결제 정보
				if ("kakaopay".equals(chk_info)) {
	                orderdetail.setPay(10);
	             }else if("easybank".equals(chk_info)) {
	                orderdetail.setPay(20);
	             }else if("creditcard".equals(chk_info)) {
	                orderdetail.setPay(31);
	             }else if("unaccount".equals(chk_info)) {
	                orderdetail.setPay(32);
	             }else if("phone".equals(chk_info)) {
	                orderdetail.setPay(33);
	             }
				
				orderdetail.setProductid(productId);
				orderdetail.setMemberid(id);
				
				//discount는 할인된 가격
//				int oriprice=aservice.findprice(productId); //12000
				ProductDTO pdto=new ProductDTO();
				pdto.setCompanyid(productId.substring(0, 2));
				pdto.setCategory(productId.substring(2, 4));
				pdto.setCategory2(productId.substring(4, 6));
				pdto.setFlavor(productId.substring(6, 8));
				String product=mmapper.getProductnameByProductcode(pdto);
				int num=mmapper.getNumByProduct(product);
				
				int sale=mmapper.isSale(num);
			    if(sale!=0) {
					sale=mmapper.getSaleByNum(num);
				}
//				int price=oriprice*(100-sale)/100;
//				orderdetail.setPrice(price); //8400
				orderdetail.setDiscount(sale);
				
				System.out.println("OrderdetailDTO 정보: " + orderdetail);
				aservice.createOrder(id, orderdetail);
			}
			aservice.changeCoupon(id, couponid);
			if(usepoint != 0) {
				mservice.usePoint(id, orderid, usepoint);
			}
			
//			주문 요약본(전체 회원 테이블) 저장
			OrdersumDTO ordersum = new OrdersumDTO();
			ordersum.setId(id);
			ordersum.setOrderid(orderid);
			ordersum.setPoint(usepoint);
			ordersum.setCouponid(couponid);
			ordersum.setCoupondiscount(coupondiscount);
			ordersum.setTotalamount(total_amount);
			System.out.println("OrdersumDTO 정보 :" + ordersum);
			aservice.createOrderSum(ordersum);
			
			
//			Delivery 테이블 저장
			DeliveryDTO delivery = new DeliveryDTO();
			delivery.setAddr1(address1);
			delivery.setAddr2(address2);
			delivery.setPhone(phone);
			delivery.setNicaddr(nicaddr);
			delivery.setPostnum(postcode);
			delivery.setReceiver(receiver);
			delivery.setOrderid(orderid);
			System.out.println("DeliveryDTO 정보: " + delivery);
			aservice.createDelivery(id, delivery);
			
//			카카오페이 결제 ==================================================
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connection = (HttpURLConnection) address.openConnection();
			connection.setDoOutput(true);
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK 69e53632b1cc374ccd928656a1bc5051");
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoInput(true);
			
			String paramsString = "cid=TC0ONETIME" +
			    "&partner_order_id=" + partner_order_id +
			    "&partner_user_id=" + partner_user_id +
			    "&item_name=" + item_name +
			    "&quantity=" + quantity +
			    "&total_amount=" + total_amount +
			    "&tax_free_amount=" + tax_free_amount +
			    "&approval_url=http://localhost:8080/dietfit/kakaopay/success" +
			    "&cancel_url=http://localhost:8080/dietfit/kakaopay/cancel" +
			    "&fail_url=http://localhost:8080/dietfit/kakaopay/fail";
			
			model.addAttribute("total_amount", total_amount);
			//주문번호, 회사ID(dietfit), product, quantity, price, tax_free_amount는 계산으로 
			
			 // 파라미터를 UTF-8로 인코딩하여 전송
            byte[] paramsBytes = paramsString.getBytes(StandardCharsets.UTF_8);
            try (DataOutputStream dataOutputStream = new DataOutputStream(connection.getOutputStream())) {
                dataOutputStream.write(paramsBytes);
                dataOutputStream.flush();
            }

            // 응답 코드 확인
            int result = connection.getResponseCode();
            InputStream inputStream = (result == 200) ? connection.getInputStream() : connection.getErrorStream();

            // 응답 데이터 읽기
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
            String response = bufferedReader.lines().collect(Collectors.joining("\n"));

            // 응답 데이터를 JSON 객체로 파싱하여 필요한 정보 추출
            // (추가로 필요한 라이브러리를 사용하여 JSON 파싱이 필요합니다)

            return response;
         } catch (IOException e) {
            e.printStackTrace();
            return "admin/order";
        }
	}
	
	
	@RequestMapping("kakaopay/success")
	public String success() {
		return "admin/kakaopay/success";
	}
	
	@RequestMapping("kakaopay/fail")
	public String fail() {
		return "admin/kakaopay/fail";
	}
	
	@RequestMapping("kakaopay/cancel")
	public String cancel() {
		return "admin/kakaopay/cancel";
	}
	@RequestMapping("myPage")
	public String myPage() {
		return "member/myPage";
	}
}
	
