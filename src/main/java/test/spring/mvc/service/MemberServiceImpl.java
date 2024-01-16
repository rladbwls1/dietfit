package test.spring.mvc.service;

import java.security.SecureRandom;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.repository.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper mapper;
		
	@Autowired
	PasswordEncoder encoder;
	
	//회원가입
	@Override
	public void newMember(Member_basicDTO dto,int path) {
		dto.setPw(encoder.encode(dto.getPw()));		//비밀번호 암호화
		mapper.newMember(dto);						//member_basic 테이블 레코드 추가 
		mapper.newMemberstatus(dto.getId());		//authoroties 테이블 레코드 추가 
		Member_detailDTO dto2=new Member_detailDTO();
		dto2.setId(dto.getId());
		dto2.setPath(path);
		mapper.newMember2(dto2);					//member_detail 테이블 레코드 추가 
		//적립금 회원 테이블 생성
		mapper.newPointSeq(dto.getId());
		mapper.newPoint(dto.getId());
		//쿠폰 회원 테이블 생성
		mapper.newCouponSeq(dto.getId());
		mapper.newCoupon(dto.getId());
		//찜 회원 테이블 생성
		mapper.newDibsSeq(dto.getId());
		mapper.newDibs(dto.getId());
		//장바구니 회원 테이블 생성
		mapper.newCartSeq(dto.getId());
		mapper.newCart(dto.getId());
		//주문상세 회원 테이블 생성
		mapper.newOrderdetail(dto.getId());
		//배송정보 회원 테이블 생성
		mapper.newDelivery(dto.getId());
	}

	@Override
	public int registerEmailCheck(String email) {
		return mapper.registerEmailCheck(email);
	}
	
	//랜덤 비밀번호
	@Override
	public String getRamdomPassword() {
        char[] charSet = new char[] {
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'q', 'w', 'e', 'r', 't', 'y', '!' };
        StringBuffer sb = new StringBuffer();
        SecureRandom sr = new SecureRandom();
        sr.setSeed(new Date().getTime());

        int idx = 0;
        int len = charSet.length;
        for (int i=0; i<10; i++) {
            idx = sr.nextInt(len);    
            sb.append(charSet[idx]);
        }
        return sb.toString();
    }

	@Override
	public Member_basicDTO getIdPw(String email) {
		return mapper.loginKakao(email);
	}

	@Override
	public int registerIdCheck(String id) {

		return mapper.registerIdCheck(id);
	}

}
