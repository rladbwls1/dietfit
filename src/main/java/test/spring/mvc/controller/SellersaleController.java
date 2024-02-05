package test.spring.mvc.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import test.spring.mvc.bean.CommercailDTO;
import test.spring.mvc.bean.OrderdetailDTO;
import test.spring.mvc.service.SellerSaleServiceImpl;

@Controller
@RequestMapping("/seller/**")
public class SellersaleController {
	
	@Autowired
    private SellerSaleServiceImpl service;
	
	// 배송조회
	@RequestMapping(value = "/tracking", method = RequestMethod.POST)
	public String trackShipment(@RequestParam("courier") String courier, @RequestParam("tracking") String tracking, Model model) {
	    model.addAttribute("courier", courier);
	    model.addAttribute("tracking", tracking);
	    return "redirect:http://info.sweettracker.co.kr/tracking/4"; 
	}
	
	// 주문 목록
	@RequestMapping("order")
	public String orderproduct(@RequestParam String companyid, Model model) {
	    List<OrderdetailDTO> order = service.orderproduct(companyid);
	    model.addAttribute("companyid",companyid);
	    model.addAttribute("order", order);
	    return "seller/orderlist";
	}
	
	// 송장번호 입력
	@RequestMapping("insertpurchase")
	public String insertpurchase(@RequestParam("orderid") String orderid,
								 @RequestParam("companyid") String companyid,
								 Model model) {
	    model.addAttribute("orderid", orderid);
		model.addAttribute("companyid", companyid);
	    return "seller/insertpurchase";
	}

	// 송장번호 입력 후 DB 저장
	@RequestMapping("purchasepro")
	public String purchasepro(@RequestParam("orderid") String orderid,
	                                @RequestParam("tracking") String tracking,
	                                @RequestParam("courier") String courier,
	                                @RequestParam("companyid") String companyid) {
	    service.updateTrackingAndCourier(tracking, courier, orderid, companyid);
	    return "seller/purchasepro";
	}
	
	// 판매량 + 정산 버튼
	@RequestMapping("calculate")
	public String calculate(@RequestParam("companyid") String companyid, Model model) {
	    model.addAttribute("companyid", companyid); // 수정됨
	    return "seller/calculate";
	}
	
	// 정상 그래프
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

	// 판매량
	@RequestMapping("salesranking")
	public String salesranking(@RequestParam("companyid") String companyid, Model model) {
		model.addAttribute(companyid);
		return "seller/salesranking";
	}
	
	// 광고 신청 기록
	@RequestMapping("commercailhome")
	public String commercailhome(@RequestParam("companyid") String companyid, Model model) {
		List<CommercailDTO> commercail = service.selectcommercial(companyid);
		model.addAttribute("commercail",commercail);
	    model.addAttribute("companyid", companyid);
	    return "seller/commercailhome";
	}
	
	// 광고 신청
	@RequestMapping("commercail")
	public String commercail(@RequestParam("companyid") String companyid, 
							 Model model) {
	    model.addAttribute("companyid", companyid);
	    return "seller/commercail";
	}
	
	@RequestMapping("commercailpro")
	public String commercailpro(@RequestParam("companyid") String companyid,
	                            @RequestParam("comname") String comname,
	                            @RequestParam("startdate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startdate,
	                            @RequestParam("enddate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date enddate,
	                            @RequestParam("comfile") MultipartFile file,
	                            Model model,
	                            HttpServletRequest request) {
	    CommercailDTO cdto = new CommercailDTO();
	    cdto.setCompanyid(companyid);
	    cdto.setComname(comname);
	    cdto.setStartdate(startdate);
	    cdto.setEnddate(enddate);
	    
	    String path = request.getServletContext().getRealPath("/resources/comimg/");
	    
	    // 파일 업로드 처리
	    String fileName = service.fileupload(file,path); 
	    cdto.setComfile(fileName); 

	    // 데이터베이스에 정보 저장
	    service.insertCommercial(cdto);

	    model.addAttribute("companyid", companyid);
	    return "redirect:/seller/commercailhome";
	}
	
	@RequestMapping("commdelect")
	public String commdelect(@RequestParam("num") Integer num,
							 @RequestParam("comfile") String comfile, 
	                         @RequestParam("companyid") String companyid, 
	                         RedirectAttributes redirectAttributes,
	                         Model model,
	                         HttpServletRequest request) {
	    service.commdelect(num);
	    String path = request.getServletContext().getRealPath("/resources/comimg/");
	    service.filedelete(comfile, path);
	    redirectAttributes.addFlashAttribute("successMessage","광고를 성공적으로 삭제되었습니다.");
	    model.addAttribute("companyid", companyid);
	    return "redirect:/seller/commercailhome?companyid=" + companyid;
	}
	
	@RequestMapping("commupdate")
	public String commupdate(@RequestParam("num") Integer num,
							 @RequestParam("companyid") String companyid,
							 CommercailDTO cdto,
							 HttpServletRequest request,
							 Model model) {
		cdto = service.commercial(num);
		String imagePath = "/resources/comimg/" + cdto.getComfile();
		model.addAttribute("cdto", cdto);
		model.addAttribute("imagePath", imagePath);
		return "seller/commupdate";
	}
	
	@RequestMapping("commupdatepro")
	public String commupdatepro(@RequestParam("num") Integer num,
	                            @RequestParam("comname") String comname,
	                            @RequestParam("comfile") MultipartFile newComFile,
	                            @RequestParam("startdate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startdate,
	                            @RequestParam("enddate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date enddate,
	                            @RequestParam("companyid") String companyid,
	                            HttpServletRequest request,
	                            Model model) {

	    String path = request.getServletContext().getRealPath("/resources/comimg/");
	    CommercailDTO existingCommercial = service.commercial(num);

	    String newcomfile;
	    if (newComFile != null && !newComFile.isEmpty()) {
	        newcomfile = service.fileupdate(newComFile, existingCommercial.getComfile(), path);
	    } else {
	        newcomfile = existingCommercial.getComfile();
	    }

	    // DB 업데이트
	    CommercailDTO cdto = new CommercailDTO();
	    cdto.setNum(num);
	    cdto.setComname(comname);
	    cdto.setComfile(newcomfile); 
	    cdto.setStartdate(startdate);
	    cdto.setEnddate(enddate);
	    cdto.setCompanyid(companyid);

	    service.commupdate(cdto);
	    
	    model.addAttribute("num", num);
	    model.addAttribute("companyid", companyid);
	    return "redirect:/seller/commercailhome";
	}



}