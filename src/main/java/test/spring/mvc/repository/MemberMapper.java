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
	//회원가입시 basic, detail, 권한
	public void newMember(Member_basicDTO dto);
	public void newMember2(Member_detailDTO dto);
	public void newMemberstatus(String id);
	
	//회원가입시 중복 이메일, 아이디 
	public int registerEmailCheck(String email);
	public int registerIdCheck(String id);
	//카카오로 로그인 한 경우
	public Member_basicDTO loginKakao(String email);
	
	//회원 아이디로 basic 정보 가져오기
	public List<Map<String,Object>> getUser(String id);
	
	//회원 아이디로 비밀번호 가져오기
	public String getPwById(String id); 
	//회원 탈퇴
	public void deleteUserself(String id);
	//회원 정보수정
	public void modifyMemberBasic(Member_basicDTO dto);
	public void modifyMemberDetail(Member_detailDTO dto);
	
	//회원 가입시 장바구니, 찜, 쿠폰, 적립금, 배송정보 테이블 생성
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
	public String getIdByEmail(String email);
	//아이디로 email 찾기
	public String getEmailById(String id);
	//아이디로 비밀번호 변경하기
	public void changePwById(@Param("id")String id, @Param("pw")String pw);
	//아이디로 이메일 변경하기
	public void changeEmailById(@Param("email")String email, @Param("id")String id);

	public int countAllProduct();
	//모든 상품 중, 페이지에 맞게 10개 가져오기
	public List<ProductDTO> findallproduct(@Param("startRow") int startRow, 
										   @Param("endRow") int endRow);
	//썸네일 가져오기
	public ProductimgDTO findlistthum(@Param("companyid") String companyid, 
							     	  @Param("category") String category,
							     	  @Param("category2") String category2);
	//관심상품에 상품 하나 추가하기
	public void addWishOne(@Param("product") String product,
						   @Param("id") String id);
	//관심상품에 상품 하나 제거하기
	public void removeWishOne(@Param("product") String product,
							  @Param("id") String id);
	public void removeWishOneByNum(@Param("num") int num,
			@Param("id") String id);
	
	//유저의 관심상품 목록에서 상품명만 가져오기
	public List<String> getWishListProduct(String id);
	//유저의 관심상품 목록 가져오기
	public List<DibsDTO> getWishList(String id);
	//상품명으로 상품코드 뽑기
	public ProductDTO getProductCodeByProductName(String product);
	//유저 관심상품 폴더명 가져오기
	public List<String> getWishFolderName(String id);
	//유저 관심상품의 폴더 변경하기
	public void changeFolder(@Param("id") String id,
			  @Param("checkedFolder") String checkedFolder,
			  @Param("num") int num);
	//유저의 관심상품의 폴더명 가져오기
	public String getFolderByNum(@Param("num") int num,
			@Param("id") String id);
}
