package test.spring.mvc.service;

import test.spring.mvc.bean.Member_basicDTO;

public interface MemberService {
	public void newMember(Member_basicDTO dto,int path);
	public int registerEmailCheck(String email);
	public int registerIdCheck(String id);
	public String getRamdomPassword();
	public Member_basicDTO getIdPw(String email);
}
