package test.spring.mvc.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;

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
	
	//ȸ�� ���Խ� ��ٱ���, ��, ����, ������, ������� 
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
	
}
