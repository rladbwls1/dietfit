package test.spring.mvc.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

//�α��� ���� �� �ڵ鷯 
public class CustomLoginHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		List<String> roleNames=new ArrayList<>();
		//security-context.xml ������ ��� ���� �̸� ��������
		auth.getAuthorities().forEach(au->{
			roleNames.add(au.getAuthority());
		});
		String rdir="/member/all";
		if(roleNames.contains("ROLE_999")){
			rdir="/member/admin";
		}else if(roleNames.contains("ROLE_888")) {
			rdir="/seller/home";
		}
		response.sendRedirect(rdir);
	}
	
	

}
