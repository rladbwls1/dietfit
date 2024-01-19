package test.spring.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		int diettdee = 0;
				
		if(bmi <= 18.5) {
			diettdee = tdeeAsInt + 200;
		}else if(bmi > 18.5 || bmi <= 20){
			diettdee = tdeeAsInt;
		}else if(bmi > 23 || bmi <= 25) {
			diettdee = tdeeAsInt - 100;
		}else if(bmi > 25 || bmi <= 30) {
			diettdee = tdeeAsInt - 300;
		}else if(bmi >= 30) {
			diettdee = tdeeAsInt - 500;
		}
	
		int protein = service.needProtein(weight);
		int fat = service.needFat(diettdee);
		int rice = service.needRice(diettdee, protein, fat);
		
		model.addAttribute("bmi", bmi);
		model.addAttribute("bmr", bmr);
		model.addAttribute("tdeeAsInt", tdeeAsInt);
		
		model.addAttribute("diettdee", diettdee);
		model.addAttribute("protein", protein);
		model.addAttribute("fat", fat);
		model.addAttribute("rice", rice);
		return "admin/survey/result";
	}
	
	@RequestMapping("surveymenu")
	public String surveymenu(int protein, Model model) {
		List<String> proteinList = service.getProtein(protein);
	    model.addAttribute("proteinList", proteinList);
	    model.addAttribute("protein", protein); // 다른 데이터도 필요한 경우 추가

		return "admin/survey/menu";
	}
	
	
	
}
