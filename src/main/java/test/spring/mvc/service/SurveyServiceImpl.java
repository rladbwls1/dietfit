package test.spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import test.spring.mvc.repository.AdminMapper;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	private AdminMapper mapper;
	
	@Override
	public double calculateBMI(double height, double weight) {
	    double bmi = weight / ((height / 100.0) * (height / 100.0));
	    return bmi;
	}


	@Override
	public double calculateBMR(String gender, double weight, double height, int age) {
	    double bmr = 0.0; 

	    if ("male".equalsIgnoreCase(gender)) { //대소문자 상관없이 일치하는지 확인
	        bmr = 10 * weight + 6.25 * height - 5 * age + 5;
	    } else if ("female".equalsIgnoreCase(gender)) {
	        bmr = 10 * weight + 6.25 * height - 5 * age - 161;
	    } else {
	        throw new IllegalArgumentException("Invalid gender");
	    }

	    return bmr;
	}

	

	@Override
	public double calculateTDEE(double bmr, double activity) {
		return bmr * activity;
	}


	@Override
	public int needProtein(double weight) {
		double dprotein =  weight * 1.0;
		int protein = (int)dprotein;
		return protein;
	}


	@Override
	public int needFat(int diettdee) {
		int fat = (int) (diettdee * 0.2) / 9;
		return fat;
	}


	@Override
	public int needRice(int diettdee, int protein, int fat) {
		int rice = (diettdee - (protein + fat)) / 4;
		return rice;
	}


	@Override
	public List<String> getProtein(int protein) {
		return mapper.getProtein(protein);
	}


	
	
	

}
