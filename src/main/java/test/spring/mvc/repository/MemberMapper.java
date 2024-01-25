package test.spring.mvc.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.DibsDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface MemberMapper {
	//ȸ�����Խ� basic, detail, ����
	public void newMember(Member_basicDTO dto);
	public void newMember2(Member_detailDTO dto);
	public void newMemberstatus(String id);
	
	//ȸ�����Խ� �ߺ� �̸���, ���̵� 
	public int registerEmailCheck(String email);
	public int registerIdCheck(String id);
	//īī���� �α��� �� ���
	public Member_basicDTO loginKakao(String email);
	
	//ȸ�� ���̵�� basic ���� ��������
	public List<Map<String,Object>> getUser(String id);
	
	//ȸ�� ���̵�� ��й�ȣ ��������
	public String getPwById(String id); 
	//ȸ�� Ż��
	public void deleteUserself(String id);
	//ȸ�� ��������
	public void modifyMemberBasic(Member_basicDTO dto);
	public void modifyMemberDetail(Member_detailDTO dto);
	
	//ȸ�� ���Խ� ��ٱ���, ��, ����, ������, ������� ���̺� ����
	public void newPoint(String id);
	public void newPointSeq(String id);
	public void newCoupon(String id);
	public void newCouponSeq(String id);
	public void newDibs(String id);
	public void newDibsSeq(String id);
	public void newCart(String id);
	public void newCartSeq(String id);
	public void newOrderdetail(String id);
	public void newDelivery(String id);
	
	//�̸��� ������ȣ
	public void newemailkey(@Param("email")String email, @Param("emailkey")String emailkey);
	public int isemailkey(String email);
	public void updateemailkey(@Param("email")String email, @Param("emailkey")String emailkey);
	public int verifiedemailkey(@Param("email")String email, @Param("emailkey")String emailkey);
	public void emailAuth(String email);
	public int isEmailAuth(String email);
	
	//�̸��Ϸ� ���̵� ã��
	public String getIdByEmail(String email);
	//���̵�� email ã��
	public String getEmailById(String id);
	//���̵�� ��й�ȣ �����ϱ�
	public void changePwById(@Param("id")String id, @Param("pw")String pw);
	//���̵�� �̸��� �����ϱ�
	public void changeEmailById(@Param("email")String email, @Param("id")String id);

	public int countAllProduct();
	//��� ��ǰ ��, �������� �°� 10�� ��������
	public List<ProductDTO> findallproduct(@Param("startRow") int startRow, 
										   @Param("endRow") int endRow);
	//����� ��������
	public ProductimgDTO findlistthum(@Param("companyid") String companyid, 
							     	  @Param("category") String category,
							     	  @Param("category2") String category2);
	//���ɻ�ǰ�� ��ǰ �ϳ� �߰��ϱ�
	public void addWishOne(@Param("product") String product,
						   @Param("id") String id);
	//���ɻ�ǰ�� ��ǰ �ϳ� �����ϱ�
	public void removeWishOne(@Param("product") String product,
							  @Param("id") String id);
	public void removeWishOneByNum(@Param("num") int num,
			@Param("id") String id);
	
	//������ ���ɻ�ǰ ��Ͽ��� ��ǰ�� ��������
	public List<String> getWishListProduct(String id);
	//������ ���ɻ�ǰ ��� ��������
	public List<DibsDTO> getWishList(String id);
	//��ǰ������ ��ǰ�ڵ� �̱�
	public ProductDTO getProductCodeByProductName(String product);
	//���� ���ɻ�ǰ ������ ��������
	public List<String> getWishFolderName(String id);
	//���� ���ɻ�ǰ�� ���� �����ϱ�
	public void changeFolder(@Param("id") String id,
			  @Param("checkedFolder") String checkedFolder,
			  @Param("num") int num);
	//������ ���ɻ�ǰ�� ������ ��������
	public String getFolderByNum(@Param("num") int num,
			@Param("id") String id);
}
