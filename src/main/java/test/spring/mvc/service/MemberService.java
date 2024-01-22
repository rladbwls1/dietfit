package test.spring.mvc.service;

import javax.mail.MessagingException;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;

public interface MemberService {
	public void newMember(Member_basicDTO dto,int path);
	public int registerEmailCheck(String email);
	public int registerIdCheck(String id);
	public String getRamdomPassword();
	public Member_basicDTO getIdPw(String email);
	public void sendMail(String email) throws MessagingException;
	public int verifiedCode(String email,String emailkey);
	public void emailAuth(String email);
	public int isEmailAuth(String email);
	public String findIdByEmail(String email);
	public void changePwById(String id, String pw);
	public void changeEmailById(String id, String email);
	public void modifyUser(Member_basicDTO basicDTO, Member_detailDTO detailDTO);
}
