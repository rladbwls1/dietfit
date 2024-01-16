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
	
	//ȸ������
	@Override
	public void newMember(Member_basicDTO dto,int path) {
		dto.setPw(encoder.encode(dto.getPw()));		//��й�ȣ ��ȣȭ
		mapper.newMember(dto);						//member_basic ���̺� ���ڵ� �߰� 
		mapper.newMemberstatus(dto.getId());		//authoroties ���̺� ���ڵ� �߰� 
		Member_detailDTO dto2=new Member_detailDTO();
		dto2.setId(dto.getId());
		dto2.setPath(path);
		mapper.newMember2(dto2);					//member_detail ���̺� ���ڵ� �߰� 
		//������ ȸ�� ���̺� ����
		mapper.newPointSeq(dto.getId());
		mapper.newPoint(dto.getId());
		//���� ȸ�� ���̺� ����
		mapper.newCouponSeq(dto.getId());
		mapper.newCoupon(dto.getId());
		//�� ȸ�� ���̺� ����
		mapper.newDibsSeq(dto.getId());
		mapper.newDibs(dto.getId());
		//��ٱ��� ȸ�� ���̺� ����
		mapper.newCartSeq(dto.getId());
		mapper.newCart(dto.getId());
		//�ֹ��� ȸ�� ���̺� ����
		mapper.newOrderdetail(dto.getId());
		//������� ȸ�� ���̺� ����
		mapper.newDelivery(dto.getId());
	}

	@Override
	public int registerEmailCheck(String email) {
		return mapper.registerEmailCheck(email);
	}
	
	//���� ��й�ȣ
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
