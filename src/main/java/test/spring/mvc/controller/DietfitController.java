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
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.vertx.java.core.json.JsonObject;

import test.spring.mvc.service.SurveyService;

@Controller
@RequestMapping("/dietfit/*")
public class DietfitController {
	
	@Autowired
	private SurveyService service;

	
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
	
	@RequestMapping("order")
	public String order() {
		return "admin/order";
	}
	
	@RequestMapping("kakaopay")
	public String kakaopay() {
		return "admin/kakaopay/pay";
	}
	
	@RequestMapping("kakaopaygo")
	public @ResponseBody String kakaopaygo(@RequestParam String partner_order_id,
	        @RequestParam String partner_user_id,
	        @RequestParam String item_name,
	        @RequestParam Integer quantity,
	        @RequestParam Integer total_amount,
	        @RequestParam Integer tax_free_amount) {
		//결제과정에서 null인경우 결제가 이루어지면 안되기 때문에 int가 아니라 Integer,
		//int는 null을 허용하지 않지만, Integer은 null을 허용함
		
		try {
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
            return "admin/kakaopay/pay";
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
}
	
