package test.spring.mvc.service;

public interface SurveyService {
	 double calculateBMI(double height, double weight);
	 double calculateBMR(String gender, double weight, double height, int age);
	 double calculateTDEE(double bmr, double activity);
	 
	 double needProtein(double weight);
	 double needFat(int diettdee);
	 double needRice(int diettdee, double protein, double fat);

}
