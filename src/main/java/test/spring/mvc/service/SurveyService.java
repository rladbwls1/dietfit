package test.spring.mvc.service;

public interface SurveyService {
	 public double calculateBMI(double height, double weight);
	 public double calculateBMR(String gender, double weight, double height, int age);
	 public double calculateTDEE(double bmr, double activity);
	 
	 public int needProtein(int diettdee);
	 public int needFat(int diettdee);
	 public int needRice(int diettdee);
}
