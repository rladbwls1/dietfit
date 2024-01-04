package test.spring.mvc.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import test.spring.mvc.bean.Member_basicDTO;
@Getter
public class CustomUser extends User{
	private Member_basicDTO dto;
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(Member_basicDTO dto) {
		super(dto.getId(),dto.getPw(),
				dto.getAuthList().stream()
				.map(auth->new SimpleGrantedAuthority(auth.getAuthority())).collect(Collectors.toList()));
		this.dto=dto;
	}
	
	


}
