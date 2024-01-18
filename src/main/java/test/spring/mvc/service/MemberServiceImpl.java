package test.spring.mvc.service;

import java.security.SecureRandom;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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
	@Transactional
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
	
	@Override
    public void sendMail(String email) throws MessagingException {
        String from = "dietfitdie@gmail.com";
        String password = "mbeoyyanzgsppied";

        // SMTP �������� ����
        Properties props = new Properties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");

        // ������ ��� ���� ���� ����
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        // ���� ����
        String emailkey=getRamdomPassword();
        String subject = "�̸��� ������ ���� ������ȣ�� �ȳ� �帳�ϴ�.";
        String text = "<div>"
        	    + "<h1 style='color: #333366;'>Dietfit �̸��� ���� �ȳ�</h1>" 
        		+ "<br /><p>"
        		 + "�ȳ��ϼ���, ȸ�������� ���� �̸��� ������ �����մϴ�. </p>"
        	     + "<hr/><p> ������ȣ: "+ emailkey+"</p>"
        	     + "<hr/></div>";

        // ���� ���� �ۼ�
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(from));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
        msg.setSubject(subject);
        msg.setContent(text, "text/html; charset=utf-8"); // html ������ ���ؼ�

        // ���� ������
        Transport.send(msg);
        
        //DB�� ����
        if(mapper.isemailkey(email)>0) {
        	mapper.updateemailkey(email, emailkey);
        }else {
        	mapper.newemailkey(email, emailkey);
        }
    }
    @Override
    public int verifiedCode(String email,String emailkey) {
    	return mapper.verifiedemailkey(email, emailkey);
    }

	@Override
	public void emailAuth(String email) {
		mapper.emailAuth(email);
	}

	@Override
	public int isEmailAuth(String email) {
		return mapper.isEmailAuth(email);
	}

	@Override
	public String findIdByEmail(String email) {
		return mapper.findIdByEmail(email);
	}

	@Override
	public void changePwById(String id, String pw) {
		mapper.changePwById(id, encoder.encode(pw));
	}
    
	
	

}
