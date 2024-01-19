package test.spring.mvc.service;

import java.util.List;


public interface SurveyService {
	 public double calculateBMI(double height, double weight);
	 public double calculateBMR(String gender, double weight, double height, int age);
	 public double calculateTDEE(double bmr, double activity);
	 
	 public int needProtein(double weight);
	 public int needFat(int diettdee);
	 public int needRice(int diettdee, int protein, int fat);
	 
	 public List<String> getProtein(int protein);

}
