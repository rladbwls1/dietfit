package test.spring.mvc.service;

import java.util.List;

import javax.mail.MessagingException;

import org.springframework.ui.Model;

import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;

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
	List<ProductDTO> findall();
	public void changeEmailById(String id, String email);
	public void modifyUser(Member_basicDTO basicDTO, Member_detailDTO detailDTO);
	public boolean pwCheck(String id, String pw);
	public void deleteUserself(String id);
	public void getallproduct(Model model,int currentPage);
	public void getProductDetail(String companyid, String category,
			String category2,String flavor, Model model);
	public void addWishOne(String product,String id);
	public void removeWishOne(String product,String id);
	public void removeWishMore(String products,String id,String checkedFolder);
	public void getWishListProduct(Model model, String id);
	public void getWishList(Model model, String id);
	public void changeFolder(String checkedFolder,String products,String id);
}
