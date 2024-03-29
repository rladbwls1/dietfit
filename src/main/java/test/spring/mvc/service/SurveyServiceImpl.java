package test.spring.mvc.service;

import org.springframework.stereotype.Service;

@Service
public class SurveyServiceImpl implements SurveyService {
	
	@Override
	public double calculateBMI(double height, double weight) {
	    double bmi = weight / ((height / 100.0) * (height / 100.0));
	    return bmi;
	}


	@Override
	public double calculateBMR(String gender, double weight, double height, int age) {
	    double bmr = 0.0; 

	    if ("male".equalsIgnoreCase(gender)) { //대소문자 상관없이 일치하는지 확인
	        bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
	    } else if ("female".equalsIgnoreCase(gender)) {
	        bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
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
	public int needProtein(int diettdee) {
		int protein = (int) (diettdee * 0.3) / 4;
		return protein;
	}


	@Override
	public int needFat(int diettdee) {
		int fat = (int) (diettdee * 0.35) / 9;
		return fat;
	}


	@Override
	public int needRice(int diettdee) {
		int rice = (int) (diettdee * 0.35) / 4;
		return rice;
	}


}
