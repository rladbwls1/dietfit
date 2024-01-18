package test.spring.mvc.repository;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;

public interface MemberMapper {
	public void newMember(Member_basicDTO dto);
	public void newMember2(Member_detailDTO dto);
	public void newMemberstatus(String id);
	public int registerEmailCheck(String email);
	public int registerIdCheck(String id);
	public Member_basicDTO loginKakao(String email);
	
	//회원 가입시 장바구니, 찜, 쿠폰, 적립금, 배송정보 
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
	
	//이메일 인증번호
	public void newemailkey(@Param("email")String email, @Param("emailkey")String emailkey);
	public int isemailkey(String email);
	public void updateemailkey(@Param("email")String email, @Param("emailkey")String emailkey);
	public int verifiedemailkey(@Param("email")String email, @Param("emailkey")String emailkey);
	public void emailAuth(String email);
	public int isEmailAuth(String email);
	
	//이메일로 아이디 찾기
	public String findIdByEmail(String email);
	//아이디로 비밀번호 변경하기
	public void changePwById(@Param("id")String id, @Param("pw")String pw);
	
}
