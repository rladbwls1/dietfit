package test.spring.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import test.spring.mvc.bean.OrderdetailDTO;
import test.spring.mvc.service.SellerSaleServiceImpl;

@Controller
@RequestMapping("/seller/**")
public class SellersaleController {
	
	@Autowired
    private SellerSaleServiceImpl service;
	
	@RequestMapping(value = "/tracking", method = RequestMethod.POST)
	public String trackShipment(@RequestParam("courier") String courier, @RequestParam("tracking") String tracking, Model model) {
	    model.addAttribute("courier", courier);
	    model.addAttribute("tracking", tracking);
	    return "redirect:http://info.sweettracker.co.kr/tracking/4"; 
	}

	
	@RequestMapping("orderhome")
	public String orderhome() {
		return "seller/orderhome";
	}

	@RequestMapping("order/{companyid}")
	public String orderproduct(@PathVariable String companyid, Model model) {
	    List<OrderdetailDTO> order = service.orderproduct(companyid);
	    model.addAttribute("companyid",companyid);
	    model.addAttribute("order", order);
	    return "seller/orderlist";
	}

	@RequestMapping("insertpurchase")
	public String insertpurchase(@RequestParam("orderid") String orderid,
								 @RequestParam("companyid") String companyid,
								 Model model) {
	    model.addAttribute("orderid", orderid);
		model.addAttribute("companyid", companyid);
	    return "seller/insertpurchase";
	}

	
	@RequestMapping("purchasepro")
	public String purchasepro(@RequestParam("orderid") String orderid,
	                                @RequestParam("tracking") String tracking,
	                                @RequestParam("courier") String courier,
	                                @RequestParam("companyid") String companyid) {
	    service.updateTrackingAndCourier(tracking, courier, orderid, companyid);
	    return "seller/purchasepro";
	}
	
	@RequestMapping("calculatehome")
	public String calculatehome() {
		return "seller/calculatehome";
	}
	
	@RequestMapping("calculate/{companyid}")
	public String calculate(@PathVariable("companyid") String companyid, Model model) {
		model.addAttribute(companyid);
		return "seller/calculate";
	}
	
	@RequestMapping("sales/{companyid}")
	public String sales(@PathVariable("companyid") String companyid, Model model) {

	    // 판매 매출액
		Integer todaySales = service.getTodaySales(companyid);
		Integer weeklySales = service.getWeeklySales(companyid);
		Integer monthlySales = service.getMonthlySales(companyid);
		// 순수 매출액
		Integer todayNetSales = service.todayNetSales(companyid);
		Integer weeklyNetSales = service.weeklyNetSales(companyid);
		Integer monthlyNetSales = service.monthlyNetSales(companyid);
		// 수수료 
		Integer todayFee = service.todayFee(companyid);
		Integer weeklyFee = service.weeklyFee(companyid);
		Integer monthlyFee = service.monthlyFee(companyid);

	    model.addAttribute("todaySales", todaySales);
	    model.addAttribute("weeklySales", weeklySales);
	    model.addAttribute("monthlySales", monthlySales);
	    
	    model.addAttribute("todayNetSales", todayNetSales);
	    model.addAttribute("weeklyNetSales", weeklyNetSales);
	    model.addAttribute("monthlyNetSales", monthlyNetSales);
	    
	    model.addAttribute("todayFee", todayFee);
	    model.addAttribute("weeklyFee", weeklyFee);
	    model.addAttribute("monthlyFee", monthlyFee);
	    
	    model.addAttribute("companyid", companyid);

	    return "seller/sales";
	}

	
	@RequestMapping("salesranking/{companyid}")
	public String salesranking(@PathVariable("companyid") String companyid, Model model) {
		model.addAttribute(companyid);
		return "seller/salesranking";
	}

}
