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
	public double needProtein(double weight) {
		double protein = weight * 1.5;
		return protein;
	}


	@Override
	public double needFat(int diettdee) {
		double fat = (diettdee * 0.2) / 9;
		return fat;
	}


	@Override
	public double needRice(int diettdee, double protein, double fat) {
		double rice = (diettdee - (protein + fat)) / 4;
		return rice;
	}
	
	

}
