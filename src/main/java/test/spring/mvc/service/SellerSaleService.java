package test.spring.mvc.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import test.spring.mvc.bean.CommercailDTO;
import test.spring.mvc.bean.OrderdetailDTO;

public interface SellerSaleService {
	
	// 회사별 상품 주문 목록 + 상품 이름
	public List<OrderdetailDTO> orderproduct(String companyid, String memberid);
	
	// 송장번호 택배사 업데이트
	public void updateTrackingAndCourier(String tracking,  String courier, String orderid, String companyid, String memberid);
	
	// 회사별 매출액 하루 일주일 한달
	public Integer getTodaySales(String companyid);
	public Integer getWeeklySales(String companyid);
	public Integer getMonthlySales(String companyid);
	
	// 회사별 순수 매출액 하루 일주일 한달
	public Integer todayNetSales(String companyid);
	public Integer weeklyNetSales(String companyid);
	public Integer monthlyNetSales(String companyid);
	
	// 회사별 수수료 하루 일주일 한달
	public Integer todayFee(String companyid);
	public Integer weeklyFee(String companyid);
	public Integer monthlyFee(String companyid);
	
	// 회사별 판매 상품 랭킹 하루 일주일 한달
	public List<OrderdetailDTO> dailySalesRank(String companyid);
	public List<OrderdetailDTO> weeklySalesRank(String companyid);
	public List<OrderdetailDTO> monthlySalesRank(String companyid);
	public List<OrderdetailDTO> allSalesRank(String companyid);
	
	// 회사 아이디
	public String findcompanyid(String id);
	
	// 광고 신청 
    public void insertCommercial(CommercailDTO commercailDTO);
    // 광고 이미지 업로드 
    public String fileupload(MultipartFile file, String path);
	// 광고 신청내역
	public List<CommercailDTO> selectcommercial(String companyid);
	
	// 광고 취소
	public void commdelect(int num);
	// 광고 이미지 삭제
	public String filedelete(String comfile, String path);
	
	// 광고 내역서
	public CommercailDTO commercial(int num);
	// 광고 수정 
	public int commupdate(CommercailDTO cdto);
	// 광고 이미지 수정
	public String fileupdate(MultipartFile file, String comfile, String path);
	
	// 전체 회원
	public List<String> allmember();
	
	// 관리자 승인 이후 광고 리스트
	public List<CommercailDTO> admincheckcom();

}
