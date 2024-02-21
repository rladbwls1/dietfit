package test.spring.mvc.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import test.spring.mvc.bean.CommercailDTO;
import test.spring.mvc.bean.OrderdetailDTO;

public interface SellerSaleService {
	
	// ȸ�纰 ��ǰ �ֹ� ��� + ��ǰ �̸�
	public List<OrderdetailDTO> orderproduct(String companyid, String memberid);
	
	// �����ȣ �ù�� ������Ʈ
	public void updateTrackingAndCourier(String tracking,  String courier, String orderid, String companyid, String memberid);
	
	// ȸ�纰 ����� �Ϸ� ������ �Ѵ�
	public Integer getTodaySales(String companyid);
	public Integer getWeeklySales(String companyid);
	public Integer getMonthlySales(String companyid);
	
	// ȸ�纰 ���� ����� �Ϸ� ������ �Ѵ�
	public Integer todayNetSales(String companyid);
	public Integer weeklyNetSales(String companyid);
	public Integer monthlyNetSales(String companyid);
	
	// ȸ�纰 ������ �Ϸ� ������ �Ѵ�
	public Integer todayFee(String companyid);
	public Integer weeklyFee(String companyid);
	public Integer monthlyFee(String companyid);
	
	// ȸ�纰 �Ǹ� ��ǰ ��ŷ �Ϸ� ������ �Ѵ�
	public List<OrderdetailDTO> dailySalesRank(String companyid);
	public List<OrderdetailDTO> weeklySalesRank(String companyid);
	public List<OrderdetailDTO> monthlySalesRank(String companyid);
	public List<OrderdetailDTO> allSalesRank(String companyid);
	
	// ȸ�� ���̵�
	public String findcompanyid(String id);
	
	// ���� ��û 
    public void insertCommercial(CommercailDTO commercailDTO);
    // ���� �̹��� ���ε� 
    public String fileupload(MultipartFile file, String path);
	// ���� ��û����
	public List<CommercailDTO> selectcommercial(String companyid);
	
	// ���� ���
	public void commdelect(int num);
	// ���� �̹��� ����
	public String filedelete(String comfile, String path);
	
	// ���� ������
	public CommercailDTO commercial(int num);
	// ���� ���� 
	public int commupdate(CommercailDTO cdto);
	// ���� �̹��� ����
	public String fileupdate(MultipartFile file, String comfile, String path);
	
	// ��ü ȸ��
	public List<String> allmember();
	
	// ������ ���� ���� ���� ����Ʈ
	public List<CommercailDTO> admincheckcom();

}
