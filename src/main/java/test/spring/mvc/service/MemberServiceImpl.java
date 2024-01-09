package test.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.repository.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper mapper;
		
	@Autowired
	PasswordEncoder encoder;
	
	@Override
	public void newMember(Member_basicDTO dto) {
		dto.setPw(encoder.encode(dto.getPw()));
		mapper.newMember(dto);
		mapper.newMemberstatus(dto.getId());
	}

}
