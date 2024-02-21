package test.spring.mvc.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.BuyproductDTO;
import test.spring.mvc.bean.CartDTO;
import test.spring.mvc.bean.CouponDTO;
import test.spring.mvc.bean.DeliveryDTO;
import test.spring.mvc.bean.DibsDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.OrderdetailDTO;
import test.spring.mvc.bean.PointDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface MemberMapper {
	//ȸ�����Խ� basic, detail, ����
	public void newMember(Member_basicDTO dto);
	public void newMember2(Member_detailDTO dto);
	public void newMember3(Member_detailDTO dto);
	public void newMemberstatus(String id);
	
	//ȸ�����Խ� �ߺ� �̸���, ���̵� 
	public int registerEmailCheck(String email);
	public int registerIdCheck(String id);
	//īī���� �α��� �� ���
	public Member_basicDTO loginKakao(String email);
	
	//ȸ�� ���̵�� basic ���� ��������
	public List<Map<String,Object>> getUser(String id);
	//���̵�� ��� ��������
	public int getStatusById(String id);
	//���̵�� ȸ��id companyid ��������
	public String getCompanyidById(String id);
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
	List<ProductDTO> findall();
	//���̵�� �̸��� �����ϱ�
	public void changeEmailById(@Param("email")String email, @Param("id")String id);

	public int countAllProduct();
	//��� ��ǰ ��, �������� �°� 10�� ��������
	public List<Map<String,Object>> findallproduct(@Param("startRow") int startRow, 
										   @Param("endRow") int endRow);
	public List<Map<String,Object>> popular(@Param("startRow") int startRow, 
			@Param("endRow") int endRow);
	public List<Map<String,Object>> priceHigh(@Param("startRow") int startRow, 
			@Param("endRow") int endRow);
	public List<Map<String,Object>> priceLow(@Param("startRow") int startRow, 
			@Param("endRow") int endRow);
	public int allproduct_count();
	//����� ��������
	public ProductimgDTO findlistthum(@Param("companyid") String companyid, 
							     	  @Param("category") String category,
							     	  @Param("category2") String category2);
	//��ȸ�� �ø���
	public void countUp(@Param("companyid") String companyid, 
	     	  			@Param("category") String category,
	     	  			@Param("category2") String category2);
    // ��ǰ��
    public Map<String,Object> findproductdetail(@Param("companyid") String companyid, 
                                @Param("category") String category, 
                                @Param("category2") String category2, 
                                @Param("flavor") String flavor);
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
	//��ǰ������ ���� �̱�
	public int getPriceByProductName(String product);
	//�򿡼� num���� product �̱�
	public String getProductByNum(@Param("id")String id,@Param("num")int num);
	//���� ���ɻ�ǰ ������ ��������
	public List<String> getWishFolderName(String id);
	//���� ���ɻ�ǰ�� ���� �����ϱ�
	public void changeFolder(@Param("id") String id,
			  @Param("checkedFolder") String checkedFolder,
			  @Param("num") int num);
	//������ ���ɻ�ǰ�� ������ ��������
	public String getFolderByNum(@Param("num") int num,
			@Param("id") String id);
	//miniCart ��ٱ���, ��ǰ ���� ��������
	public List<ProductDTO> getProductByCompanyidCateCate2(@Param("companyid") String companyid, 
							     	  @Param("category") String category,
							     	  @Param("category2") String category2);
	//num���� product ����, ���� ���� ��������
	public Map<String,Object> getMiniCartByNum(int num);
	//��ٱ��Ͽ� �̹� �ִ� ��ǰ���� Ȯ��
	public int isCart(@Param("id")String id, @Param("product") String product);
	//��ٱ��Ͽ� �ϳ��� ��ǰ �߰�
	public void addCartOne(@Param("id")String id, @Param("product") String product, 
			@Param("quantity")int quantity, @Param("price")int price, @Param("delivery")int delivery);
	//��ٱ��� ��� ��������
	public List<Map<String,Object>> getCartList(String id);
	//��ٱ��� ���� ����
	public void updateCart(@Param("id")String id, @Param("quantity")int quantity, @Param("num")int num );
	//��ٱ��� ��� ����
	public void deleteCart(@Param("id")String id, @Param("num")int num );
	//��ٱ��Ͽ��� ���� ������ ��ϸ� ��������
	public CartDTO getCartListByNum(@Param("id")String id, @Param("num")int num );
	//����� ������� �� ����� �߰�
	public void addDelivery(@Param("dto")DeliveryDTO dto,@Param("id")String id);
	//����� ����� ��� ��������
	public List<DeliveryDTO> getUserDelivery(String id);
	//����� ��������� ���� ���� ���� �Ǵ�, 1�̸� ���� 0�̸� ����
	public int checkNicaddr(@Param("id")String id, @Param("nicaddr")String nicaddr);
	//����� �����, �⺻ ����� ����
	public void removeDefaultDelivery(String id);
	//����� �����, �⺻ ����� ����
	public void setDefaultDelivery(@Param("id")String id, @Param("nicaddr")String nicaddr);
	//����� ����� ����
	public void deleteDelivery(@Param("id")String id, @Param("nicaddr")String nicaddr);
	//��ǰ������ �Խñ� ��ȣ ��������
	public int getNumByProduct(String product);
	//�Խñ� ��ȣ�� ������ ��������
	public int isSale(int num);
	public int getSaleByNum(int num);
	
	//����
	//��������
	public int couponcount();
	public List<AllcouponDTO> couponList();
	//������ ������ ������ȣ ����
	public List<String> getUserCouponid(String id);
	//���� �ٿ�ε�
	public void downloadCoupon(@Param("id")String id, @Param("cdto")CouponDTO cdto);
	//����� ���� ����ó��
	public void checkUsableCoupon(String id);
	//���� ���� ��������
	public List<CouponDTO> getUserCoupon(String id);
	//���� �ֹ� ���� ��������
	public List<Map<String,Object>> getUserOrder(String id);
	//��ǰ�ڵ�� ��ǰ�� �˻�
	public String getProductnameByProductcode(ProductDTO dto);
	//�ֹ���ȣ�� ������� ����� ���� ��������
	public DeliveryDTO getDeliveryByOrderid(@Param("id")String id, @Param("orderid")String orderid);
	//�ֹ���ȣ�� �ֹ��� ��������
	public List<OrderdetailDTO> getOrderDetailByOrderid(@Param("id")String id, @Param("orderid")String orderid);
	//�ֹ���ȣ�� ��ǰ�ڵ�� �ֹ��� ��������
	public OrderdetailDTO getOrderDetailByOrderidAndProductid(@Param("id")String id, 
			@Param("orderid")String orderid,@Param("productid")String productid);
	//�ֹ��� ȭ�鿡�� ������ ��ǰ�� ���� �ۼ� ���� �Ǵ�
	public int isReviewByOrderidAndProductcode(ProductDTO odto);
	
	//������
	//����Ȯ�� orderdetail �÷� ����
	public void defintePurchase(@Param("id")String id, 
			@Param("orderid")String orderid,@Param("productid")String productid);
	//����Ȯ�� buyproduct ���ڵ� �߰�
	public void addDefintePurchaseToBuyproduct(BuyproductDTO dto);
	//���� �������� null�̸� 0, �ƴϸ� 1
	public int isPoint(String id);
	//ȸ���� ���� ���� ������ ��������
	public int getPoint(String id);
	//������ ����
	public void addPoint(@Param("id")String id,@Param("point")PointDTO point);
	//������ �Ҹ�
	public void deletePoint(@Param("id")String id,@Param("point")PointDTO point);
	//������ ���
	public void usePoint(@Param("id")String id,@Param("point")PointDTO point);
	//ȸ���� ���� % ��������
	public double getBonus(String id);
	//ȸ���� ���� ���� ��������
	public List<PointDTO> getPointList(String id);
	//����� ������ num ��������
	public List<PointDTO> getDuePointNum(String id);
	
	
}
