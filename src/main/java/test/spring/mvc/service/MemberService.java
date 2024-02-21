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
	//회원가입
	public void newMember(Member_basicDTO dto,int path);
	//판매자 회원가입
	public void newMember2(Member_basicDTO bdto,Member_detailDTO ddto ,int path);
	//이미 가입된 이메일이면 1, 아니면 0
	public int registerEmailCheck(String email);
	//이미 가입된 아이디면 1, 아니면 0
	public int registerIdCheck(String id);
	//랜덤 비밀번호 생성
	public String getRamdomPassword();
	//카카오로 로그인한 경우 id, pw 가져오기 
	public Member_basicDTO getIdPw(String email);
	//인증 메일 전송
	public void sendMail(String email) throws MessagingException;
	//이메일 인증 맞으면 1, 틀리면 0
	public int verifiedCode(String email,String emailkey);
	//emailAuth에 1 주기
	public void emailAuth(String email);
	//이메일 인증된 경우 1, 아니면 0
	public int isEmailAuth(String email);
	//email로 가입된 아이디 반환
	public String findIdByEmail(String email);
	//비밀번호 변경
	public void changePwById(String id, String pw);
	
	public List<ProductDTO> findall();
	//이메일 변경
	public void changeEmailById(String id, String email);
	//유저 정보 수정(자의)
	public void modifyUser(Member_basicDTO basicDTO, Member_detailDTO detailDTO);
	//비밀번호가 일치한 경우 true, 아니면 false
	public boolean pwCheck(String id, String pw);
	//회원 탈퇴(자의)
	public void deleteUserself(String id);
	//상품 목록 가져오기 + 페이지
	public void getallproduct(Model model,int currentPage, String condition);
	public void getcategoryproduct(Model model,int currentPage, String orderBy , String condition);
	
	//상품의 상세 설명 model로 넘김
	public List<String> getProductDetail(String companyid, String category,
			String category2,String flavor, Model model);
	//상품목록에서 하트 아이콘 눌러서 관심상품에 추가하는 경우
	public void addWishOne(String product,String id);
	//상품목록에서 하트 아이콘 눌러서 관심상품에서 삭제하는 경우
	public void removeWishOne(String product,String id);
	//관심상품 목록창에서 관심상품 선택 삭제
	public void removeWishMore(String products,String id,String checkedFolder);
	//유저의 관심상품 목록에서 상품명만 가져오기
	public void getWishListProduct(Model model, String id);
	//관심상품 전체 목록 dibsDTO + 썸네일 model로 넘김
	public void getWishList(Model model, String id,int currentPage,String checkedFolder);
	//관심상품 목록 dibsDTO + 썸네일 model로 넘김
	public void getWishListWithFolder(Model model, String id,int currentPage,String checkedFolder);
	//관심상품에서 선택상품의 폴더 변경
	public void changeFolder(String checkedFolder,String products,String id);
	//장바구니에 하나의 상품 추가 
	public void addCartOne(String id,String product,int quantity,int price, int delivery);
	//관심목록에서 여러 상품을 장바구니에 추가하는 경우
	public void addCartMore(String id,String product);
	//장바구니 담기
	public void miniCart(int num,Model model);
	//전체 장바구니 목록 가져오기+썸네일
	public void getCartList(Model model, String id);
	//장바구니 수량 변경
	public void updateCartQuantity(String id, int num,int quantity);
	//장바구니 선택 상품 삭제
	public void deleteCart(String id, int num);
	//사용자 배송지 추가
	public void addDelivery(DeliveryDTO dto,String id);
	//사용자 배송지, 기본 배송지 설정
	public void setDefaultDelivery(String id,String nicaddr);
	//사용자 배송지 삭제
	public void deleteDelivery(String id,String nicaddr);
	
	//쿠폰
	public int couponcount();
	public void couponList(Model model);
	//쿠폰 다운로드
	public void downloadCoupon(String id,CouponDTO cdto);
	//유저 쿠폰 불러오기 ( 기간 만료된 건 만료 처리해줌)
	public List<CouponDTO> getUserCoupon(String id);
	//유저 주문/배송 정보 가져오기 
	public void getUserOrder(String id,Model model);
	//유저의 주문번호로 주문상세 가져오기
	public void getOrderDetailByOrderid(String id,String orderid,Model model);
	
	//적립금
	//구매확정과 적립금 적립
	public void defintePurchase(String id, String orderid, String productid,int price);
	//보유 적립금 가져오기
	public int getPoint(String id);
	//적립금 사용
	public void usePoint(String id,String orderid,int point);
	//최근 본 상품
	//쿠키로 상품 정보 꺼내기
    public void getProductByCookie(List<String> recentlyViewedProducts,Model model);
    
}
