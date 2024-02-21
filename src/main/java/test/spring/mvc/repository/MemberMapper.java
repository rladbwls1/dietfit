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
	//회원가입시 basic, detail, 권한
	public void newMember(Member_basicDTO dto);
	public void newMember2(Member_detailDTO dto);
	public void newMember3(Member_detailDTO dto);
	public void newMemberstatus(String id);
	
	//회원가입시 중복 이메일, 아이디 
	public int registerEmailCheck(String email);
	public int registerIdCheck(String id);
	//카카오로 로그인 한 경우
	public Member_basicDTO loginKakao(String email);
	
	//회원 아이디로 basic 정보 가져오기
	public List<Map<String,Object>> getUser(String id);
	//아이디로 등급 가져오기
	public int getStatusById(String id);
	//아이디로 회사id companyid 가져오기
	public String getCompanyidById(String id);
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
	List<ProductDTO> findall();
	//아이디로 이메일 변경하기
	public void changeEmailById(@Param("email")String email, @Param("id")String id);

	public int countAllProduct();
	//모든 상품 중, 페이지에 맞게 10개 가져오기
	public List<Map<String,Object>> findallproduct(@Param("startRow") int startRow, 
										   @Param("endRow") int endRow);
	public List<Map<String,Object>> popular(@Param("startRow") int startRow, 
			@Param("endRow") int endRow);
	public List<Map<String,Object>> priceHigh(@Param("startRow") int startRow, 
			@Param("endRow") int endRow);
	public List<Map<String,Object>> priceLow(@Param("startRow") int startRow, 
			@Param("endRow") int endRow);
	public int allproduct_count();
	//썸네일 가져오기
	public ProductimgDTO findlistthum(@Param("companyid") String companyid, 
							     	  @Param("category") String category,
							     	  @Param("category2") String category2);
	//조회수 올리기
	public void countUp(@Param("companyid") String companyid, 
	     	  			@Param("category") String category,
	     	  			@Param("category2") String category2);
    // 상품상세
    public Map<String,Object> findproductdetail(@Param("companyid") String companyid, 
                                @Param("category") String category, 
                                @Param("category2") String category2, 
                                @Param("flavor") String flavor);
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
	//상품명으로 가격 뽑기
	public int getPriceByProductName(String product);
	//찜에서 num으로 product 뽑기
	public String getProductByNum(@Param("id")String id,@Param("num")int num);
	//유저 관심상품 폴더명 가져오기
	public List<String> getWishFolderName(String id);
	//유저 관심상품의 폴더 변경하기
	public void changeFolder(@Param("id") String id,
			  @Param("checkedFolder") String checkedFolder,
			  @Param("num") int num);
	//유저의 관심상품의 폴더명 가져오기
	public String getFolderByNum(@Param("num") int num,
			@Param("id") String id);
	//miniCart 장바구니, 상품 정보 가져오기
	public List<ProductDTO> getProductByCompanyidCateCate2(@Param("companyid") String companyid, 
							     	  @Param("category") String category,
							     	  @Param("category2") String category2);
	//num으로 product 정보, 할인 정보 가져오기
	public Map<String,Object> getMiniCartByNum(int num);
	//장바구니에 이미 있는 상품인지 확인
	public int isCart(@Param("id")String id, @Param("product") String product);
	//장바구니에 하나의 상품 추가
	public void addCartOne(@Param("id")String id, @Param("product") String product, 
			@Param("quantity")int quantity, @Param("price")int price, @Param("delivery")int delivery);
	//장바구니 목록 가져오기
	public List<Map<String,Object>> getCartList(String id);
	//장바구니 개수 수정
	public void updateCart(@Param("id")String id, @Param("quantity")int quantity, @Param("num")int num );
	//장바구니 목록 삭제
	public void deleteCart(@Param("id")String id, @Param("num")int num );
	//장바구니에서 개수 수정한 목록만 가져오기
	public CartDTO getCartListByNum(@Param("id")String id, @Param("num")int num );
	//사용자 배송지에 새 배송지 추가
	public void addDelivery(@Param("dto")DeliveryDTO dto,@Param("id")String id);
	//사용자 배송지 목록 가져오기
	public List<DeliveryDTO> getUserDelivery(String id);
	//사용자 배송지에서 동일 별명 유무 판단, 1이면 있음 0이면 없음
	public int checkNicaddr(@Param("id")String id, @Param("nicaddr")String nicaddr);
	//사용자 배송지, 기본 배송지 없앰
	public void removeDefaultDelivery(String id);
	//사용자 배송지, 기본 배송지 설정
	public void setDefaultDelivery(@Param("id")String id, @Param("nicaddr")String nicaddr);
	//사용자 배송지 삭제
	public void deleteDelivery(@Param("id")String id, @Param("nicaddr")String nicaddr);
	//상품명으로 게시글 번호 가져오기
	public int getNumByProduct(String product);
	//게시글 번호로 할인율 가져오기
	public int isSale(int num);
	public int getSaleByNum(int num);
	
	//쿠폰
	//쿠폰개수
	public int couponcount();
	public List<AllcouponDTO> couponList();
	//유저가 보유한 쿠폰번호 추출
	public List<String> getUserCouponid(String id);
	//쿠폰 다운로드
	public void downloadCoupon(@Param("id")String id, @Param("cdto")CouponDTO cdto);
	//만료된 쿠폰 만료처리
	public void checkUsableCoupon(String id);
	//유저 쿠폰 가져오기
	public List<CouponDTO> getUserCoupon(String id);
	//유저 주문 정보 가져오기
	public List<Map<String,Object>> getUserOrder(String id);
	//상품코드로 상품명 검색
	public String getProductnameByProductcode(ProductDTO dto);
	//주문번호로 사용자의 배송지 정보 가져오기
	public DeliveryDTO getDeliveryByOrderid(@Param("id")String id, @Param("orderid")String orderid);
	//주문번호로 주문상세 가져오기
	public List<OrderdetailDTO> getOrderDetailByOrderid(@Param("id")String id, @Param("orderid")String orderid);
	//주문번호와 상품코드로 주문상세 가져오기
	public OrderdetailDTO getOrderDetailByOrderidAndProductid(@Param("id")String id, 
			@Param("orderid")String orderid,@Param("productid")String productid);
	//주문상세 화면에서 구매한 상품의 리뷰 작성 여부 판단
	public int isReviewByOrderidAndProductcode(ProductDTO odto);
	
	//적립금
	//구매확정 orderdetail 컬럼 수정
	public void defintePurchase(@Param("id")String id, 
			@Param("orderid")String orderid,@Param("productid")String productid);
	//구매확정 buyproduct 레코드 추가
	public void addDefintePurchaseToBuyproduct(BuyproductDTO dto);
	//보유 적립금이 null이면 0, 아니면 1
	public int isPoint(String id);
	//회원의 현재 보유 적립금 가져오기
	public int getPoint(String id);
	//적립금 적립
	public void addPoint(@Param("id")String id,@Param("point")PointDTO point);
	//적립금 소멸
	public void deletePoint(@Param("id")String id,@Param("point")PointDTO point);
	//적립금 사용
	public void usePoint(@Param("id")String id,@Param("point")PointDTO point);
	//회원의 적립 % 가져오기
	public double getBonus(String id);
	//회원의 적립 내역 가져오기
	public List<PointDTO> getPointList(String id);
	//만료된 적립금 num 가져오기
	public List<PointDTO> getDuePointNum(String id);
	
	
}
