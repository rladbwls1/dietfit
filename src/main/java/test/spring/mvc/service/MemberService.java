package test.spring.mvc.service;

import java.util.List;

import javax.mail.MessagingException;

import org.springframework.ui.Model;

import test.spring.mvc.bean.CouponDTO;
import test.spring.mvc.bean.DeliveryDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;

public interface MemberService {
	//ȸ������
	public void newMember(Member_basicDTO dto,int path);
	//�Ǹ��� ȸ������
	public void newMember2(Member_basicDTO bdto,Member_detailDTO ddto ,int path);
	//�̹� ���Ե� �̸����̸� 1, �ƴϸ� 0
	public int registerEmailCheck(String email);
	//�̹� ���Ե� ���̵�� 1, �ƴϸ� 0
	public int registerIdCheck(String id);
	//���� ��й�ȣ ����
	public String getRamdomPassword();
	//īī���� �α����� ��� id, pw �������� 
	public Member_basicDTO getIdPw(String email);
	//���� ���� ����
	public void sendMail(String email) throws MessagingException;
	//�̸��� ���� ������ 1, Ʋ���� 0
	public int verifiedCode(String email,String emailkey);
	//emailAuth�� 1 �ֱ�
	public void emailAuth(String email);
	//�̸��� ������ ��� 1, �ƴϸ� 0
	public int isEmailAuth(String email);
	//email�� ���Ե� ���̵� ��ȯ
	public String findIdByEmail(String email);
	//��й�ȣ ����
	public void changePwById(String id, String pw);
	
	public List<ProductDTO> findall();
	//�̸��� ����
	public void changeEmailById(String id, String email);
	//���� ���� ����(����)
	public void modifyUser(Member_basicDTO basicDTO, Member_detailDTO detailDTO);
	//��й�ȣ�� ��ġ�� ��� true, �ƴϸ� false
	public boolean pwCheck(String id, String pw);
	//ȸ�� Ż��(����)
	public void deleteUserself(String id);
	//��ǰ ��� �������� + ������
	public void getallproduct(Model model,int currentPage, String condition);
	public void getcategoryproduct(Model model,int currentPage, String orderBy , String condition);
	
	//��ǰ�� �� ���� model�� �ѱ�
	public List<String> getProductDetail(String companyid, String category,
			String category2,String flavor, Model model);
	//��ǰ��Ͽ��� ��Ʈ ������ ������ ���ɻ�ǰ�� �߰��ϴ� ���
	public void addWishOne(String product,String id);
	//��ǰ��Ͽ��� ��Ʈ ������ ������ ���ɻ�ǰ���� �����ϴ� ���
	public void removeWishOne(String product,String id);
	//���ɻ�ǰ ���â���� ���ɻ�ǰ ���� ����
	public void removeWishMore(String products,String id,String checkedFolder);
	//������ ���ɻ�ǰ ��Ͽ��� ��ǰ�� ��������
	public void getWishListProduct(Model model, String id);
	//���ɻ�ǰ ��ü ��� dibsDTO + ����� model�� �ѱ�
	public void getWishList(Model model, String id,int currentPage,String checkedFolder);
	//���ɻ�ǰ ��� dibsDTO + ����� model�� �ѱ�
	public void getWishListWithFolder(Model model, String id,int currentPage,String checkedFolder);
	//���ɻ�ǰ���� ���û�ǰ�� ���� ����
	public void changeFolder(String checkedFolder,String products,String id);
	//��ٱ��Ͽ� �ϳ��� ��ǰ �߰� 
	public void addCartOne(String id,String product,int quantity,int price, int delivery);
	//���ɸ�Ͽ��� ���� ��ǰ�� ��ٱ��Ͽ� �߰��ϴ� ���
	public void addCartMore(String id,String product);
	//��ٱ��� ���
	public void miniCart(int num,Model model);
	//��ü ��ٱ��� ��� ��������+�����
	public void getCartList(Model model, String id);
	//��ٱ��� ���� ����
	public void updateCartQuantity(String id, int num,int quantity);
	//��ٱ��� ���� ��ǰ ����
	public void deleteCart(String id, int num);
	//����� ����� �߰�
	public void addDelivery(DeliveryDTO dto,String id);
	//����� �����, �⺻ ����� ����
	public void setDefaultDelivery(String id,String nicaddr);
	//����� ����� ����
	public void deleteDelivery(String id,String nicaddr);
	
	//����
	public int couponcount();
	public void couponList(Model model);
	//���� �ٿ�ε�
	public void downloadCoupon(String id,CouponDTO cdto);
	//���� ���� �ҷ����� ( �Ⱓ ����� �� ���� ó������)
	public List<CouponDTO> getUserCoupon(String id);
	//���� �ֹ�/��� ���� �������� 
	public void getUserOrder(String id,Model model);
	//������ �ֹ���ȣ�� �ֹ��� ��������
	public void getOrderDetailByOrderid(String id,String orderid,Model model);
	
	//������
	//����Ȯ���� ������ ����
	public void defintePurchase(String id, String orderid, String productid,int price);
	//���� ������ ��������
	public int getPoint(String id);
	//������ ���
	public void usePoint(String id,String orderid,int point);
	//�ֱ� �� ��ǰ
	//��Ű�� ��ǰ ���� ������
    public void getProductByCookie(List<String> recentlyViewedProducts,Model model);
    
}
