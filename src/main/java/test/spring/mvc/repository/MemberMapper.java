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

}
