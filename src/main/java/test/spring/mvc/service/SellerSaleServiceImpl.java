package test.spring.mvc.service;


import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import test.spring.mvc.bean.CommercailDTO;
import test.spring.mvc.bean.OrderdetailDTO;
import test.spring.mvc.repository.SellerMapper;
import test.spring.mvc.repository.SellerSaleMapper;

@Service
public class SellerSaleServiceImpl implements SellerSaleService{
	
	@Autowired
	private SellerSaleMapper sellermapper;
	@Autowired
	private SellerMapper sellermapper1;

	@Override
	public List<OrderdetailDTO> orderproduct(String companyid, String memberid) {
		return sellermapper.orderproduct(companyid,memberid);
	}

	@Override
	public void updateTrackingAndCourier(String tracking, String courier ,String orderid, String companyid, String memberid) {
		companyid+="%";
		sellermapper.updateTrackingAndCourier( tracking, courier ,orderid, companyid,memberid );
	}

	@Override
	public Integer  getTodaySales(String companyid) {
		return sellermapper.getTodaySales(companyid);
	}

	@Override
	public Integer  getWeeklySales(String companyid) {
		return sellermapper.getWeeklySales(companyid);
	}

	@Override
	public Integer  getMonthlySales(String companyid) {
		return sellermapper.getMonthlySales(companyid);
	}

	@Override
	public Integer todayNetSales(String companyid) {
		return sellermapper.todayNetSales(companyid);
	}

	@Override
	public Integer weeklyNetSales(String companyid) {
		return sellermapper.weeklyNetSales(companyid);
	}

	@Override
	public Integer monthlyNetSales(String companyid) {
		return sellermapper.monthlyNetSales(companyid);
	}

	@Override
	public Integer todayFee(String companyid) {
		return sellermapper.todayFee(companyid);
	}

	@Override
	public Integer weeklyFee(String companyid) {
		return sellermapper.weeklyFee(companyid);
	}

	@Override
	public Integer monthlyFee(String companyid) {
		return sellermapper.monthlyFee(companyid);
	}

	@Override
	public String findcompanyid(String id) {
		return sellermapper1.findcompanyid(id);
	}
	// 광고 신청
	@Override
	public void insertCommercial(CommercailDTO commercial) {
	    sellermapper.insertCommercial(commercial);
	}

	@Override
	public List<CommercailDTO> selectcommercial(String companyid) {
		return sellermapper.selectcommercial(companyid);
	}

	@Override
	public String fileupload(MultipartFile file, String path) {
	    String originalFileName = file.getOriginalFilename();
	    String uuid = UUID.randomUUID().toString();
	    String uuidName = uuid + "-" + originalFileName;
	    File saveFile = new File(path, uuidName);
	    try {
	        file.transferTo(saveFile);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return uuidName;
	}

	@Override
	public void commdelect(int num) {
		sellermapper.commdelect(num);
	}

	@Override
	public String filedelete(String comfile, String path) {
	    String fullPath = path + comfile;
	    File file = new File(fullPath);
	    file.delete();
	    return "삭제 성공";
	}

	@Override
	public CommercailDTO commercial(int num) {
		 return sellermapper.commercial(num);
	}

	@Override
	public int commupdate(CommercailDTO cdto) {
		return sellermapper.commupdate(cdto);
	}

	@Override
	public String fileupdate(MultipartFile file, String comfile, String path) {
	    filedelete(comfile, path);
	    return fileupload(file, path);
	}
	
	@Override
	public List<String> allmember() {
        return sellermapper.allmember();
    }

	@Override
	public List<OrderdetailDTO> dailySalesRank(String companyid) {
		return sellermapper.dailySalesRank(companyid);
	}

	@Override
	public List<OrderdetailDTO> weeklySalesRank(String companyid) {
		return sellermapper.weeklySalesRank(companyid);
	}

	@Override
	public List<OrderdetailDTO> monthlySalesRank(String companyid) {
		return sellermapper.monthlySalesRank(companyid);
	}

	@Override
	public List<OrderdetailDTO> allSalesRank(String companyid) {
		return sellermapper.allSalesRank(companyid);
	}

	@Override
	public List<CommercailDTO> admincheckcom() {
		return sellermapper.admincheckcom();
	}
}
