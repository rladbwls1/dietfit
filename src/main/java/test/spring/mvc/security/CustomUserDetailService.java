package test.spring.mvc.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.repository.SecurityMapper;

public class CustomUserDetailService implements UserDetailsService{
	@Autowired
	private SecurityMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//form에서 넘어오는 username으로 작업.
		Member_basicDTO dto=mapper.read(username);
		
		return dto==null?null:new CustomUser(dto);
	}

}
