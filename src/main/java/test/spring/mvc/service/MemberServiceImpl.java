package test.spring.mvc.service;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import test.spring.mvc.bean.DibsDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.repository.MemberMapper;
import test.spring.mvc.repository.Seller1Mapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private Seller1Mapper sel1mapper;
		
	@Autowired
	PasswordEncoder encoder;
	
	//회원가입
	@Override
	@Transactional
	public void newMember(Member_basicDTO dto,int path) {
		dto.setPw(encoder.encode(dto.getPw()));		//비밀번호 암호화
		mapper.newMember(dto);						//member_basic 테이블 레코드 추가 
		mapper.newMemberstatus(dto.getId());		//authoroties 테이블 레코드 추가 
		Member_detailDTO dto2=new Member_detailDTO();
		dto2.setId(dto.getId());
		dto2.setPath(path);
		mapper.newMember2(dto2);					//member_detail 테이블 레코드 추가 
		//적립금 회원 테이블 생성
		mapper.newPointSeq(dto.getId());
		mapper.newPoint(dto.getId());
		//쿠폰 회원 테이블 생성
		mapper.newCouponSeq(dto.getId());
		mapper.newCoupon(dto.getId());
		//찜 회원 테이블 생성
		mapper.newDibsSeq(dto.getId());
		mapper.newDibs(dto.getId());
		//장바구니 회원 테이블 생성
		mapper.newCartSeq(dto.getId());
		mapper.newCart(dto.getId());
		//주문상세 회원 테이블 생성
		mapper.newOrderdetail(dto.getId());
		//배송정보 회원 테이블 생성
		mapper.newDelivery(dto.getId());
	}

	@Override
	public int registerEmailCheck(String email) {
		return mapper.registerEmailCheck(email);
	}
	
	//랜덤 비밀번호
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

        // SMTP 프로토콜 설정
        Properties props = new Properties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");

        // 보내는 사람 계정 정보 설정
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        // 메일 내용
        String emailkey=getRamdomPassword();
        String subject = "이메일 인증을 위한 인증번호를 안내 드립니다.";
        String text = "<div>"
        	    + "<h1 style='color: #333366;'>Dietfit 이메일 인증 안내</h1>" 
        		+ "<br /><p>"
        		 + "안녕하세요, 회원가입을 위해 이메일 인증을 진행합니다. </p>"
        	     + "<hr/><p> 인증번호: "+ emailkey+"</p>"
        	     + "<hr/></div>";

        // 메일 내용 작성
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(from));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
        msg.setSubject(subject);
        msg.setContent(text, "text/html; charset=utf-8"); // html 보내기 위해서

        // 메일 보내기
        Transport.send(msg);
        
        //DB에 저장
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
		return mapper.getIdByEmail(email);
	}

	@Override
	public void changePwById(String id, String pw) {
		mapper.changePwById(id, encoder.encode(pw));
	}

	@Override
	public void modifyUser(Member_basicDTO basicDTO, Member_detailDTO detailDTO) {
		//java.sql.Date sqlDate=new java.sql.Date(detailDTO.getBirth().getTime());
		//detailDTO.setBirth(sqlDate);
		//System.out.println(detailDTO.getBirth());
		mapper.modifyMemberBasic(basicDTO);
		mapper.modifyMemberDetail(detailDTO);
	}

	@Override
	public void changeEmailById(String id, String email) {
		mapper.changeEmailById(email, id);
	}

	@Override
	public boolean pwCheck(String id, String pw) {
		String dbPw=mapper.getPwById(id);
		return encoder.matches(pw, dbPw);
	}

	@Override
	public void deleteUserself(String id) {
		mapper.deleteUserself(id);
	}

	@Override
	public void getallproduct(Model model, int currentPage) {
		int pageSize=10;
		int startRow=(currentPage-1)*pageSize+1;		//시작
		int endRow=currentPage*pageSize;				//끝
		int count=mapper.countAllProduct();
		List<ProductDTO> products = mapper.findallproduct(startRow,endRow);
	    if (products != null) {
	        for (ProductDTO product : products) {
	            ProductimgDTO img = mapper.findlistthum(product.getCompanyid(),product.getCategory(), product.getCategory2());
	            if (img != null) {
	                // 이미지 경로 직접 조합하여 설정
	                String imagePath = "/resources/p_img/" + img.getCompanyid() +
	                                   img.getCategory() + img.getCategory2() +
	                                   img.getFlavor() + "F" + img.getNum() +
	                                   img.getExt();
	               product.setImagePath(imagePath);
	            }
	        }
	        model.addAttribute("products", products);
	    }
	    //페이지
		int pageBlock=10;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		int startPage=(int)(currentPage%pageBlock==0?currentPage/pageBlock-1:currentPage/pageBlock)*pageBlock+1;
		int endPage=startPage + pageBlock - 1;

		model.addAttribute("count",count);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
	    
	}

	@Override
	public void getProductDetail(String companyid, String category, String category2, String flavor, Model model) {
		ProductDTO product = sel1mapper.findproductdetail(companyid, category, category2, flavor);

        // 썸네일 이미지 정보를 가져옴
        List<ProductimgDTO> thumbnails = sel1mapper.findthumimg(companyid, category, category2);

        // 대표 이미지 정보를 가져옴
        List<ProductimgDTO> images = sel1mapper.findimg(companyid, category, category2);

        List<String> thumbnailPaths = new ArrayList<>();
        List<String> imagePaths = new ArrayList<>();

        // 썸네일 이미지 경로들을 생성
        for (ProductimgDTO thumbnail : thumbnails) {
            String path = "/resources/p_img/" + thumbnail.getCompanyid() +
                          thumbnail.getCategory() + thumbnail.getCategory2() +
                          thumbnail.getFlavor() + "F" + thumbnail.getNum() +
                          thumbnail.getExt();
            thumbnailPaths.add(path);
        }

        // 대표 이미지 경로들을 생성
        for (ProductimgDTO image : images) {
            String path = "/resources/p_img/" + image.getCompanyid() +
                          image.getCategory() + image.getCategory2() +
                          image.getFlavor() + "F" + image.getNum() +
                          image.getExt();
            imagePaths.add(path);
        }

        // 모델에 추가
        model.addAttribute("product", product);
        model.addAttribute("thumbnailPaths", thumbnailPaths);
        model.addAttribute("imagePaths", imagePaths);
	}

	@Override
	public void addWishOne(String product,String id) {
		mapper.addWishOne(product,id);
	}

	@Override
	public void getWishListProduct(Model model, String id) {
		model.addAttribute("wishList",mapper.getWishListProduct(id));
	}

	@Override
	public void removeWishOne(String product, String id) {
		mapper.removeWishOne(product,id);
	}

	@Override
	public void removeWishMore(String products, String id,String checkedFolder) {
		String[] product1=products.split(",");
		String removeFolder=checkedFolder;
			//
		for (String num1 : product1) {
			int num=Integer.parseInt(num1);
			if(checkedFolder.equals("전체")) {
				mapper.removeWishOneByNum(num,id);
			}else {
				String Folder=mapper.getFolderByNum(num,id);
				if(Folder.contains(",")) {
					String[] folderarray=Folder.split(",");
					List<String> folderList= new ArrayList<>(Arrays.asList(folderarray));
					folderList.remove(removeFolder);
					checkedFolder=String.join(",", folderList);
					mapper.changeFolder(id, checkedFolder, num);
				}else {
					mapper.removeWishOneByNum(num,id);
				}
			}
		}
	}

	@Override
	public void getWishList(Model model, String id) {
		List<DibsDTO> dibs = mapper.getWishList(id);
		List<String> imgPaths=new ArrayList<>();
	    if (dibs != null) {
	        for (DibsDTO dib: dibs) {
	        	//상품명으로 기업아이디, 대분류, 소분류 찾아서 값 넣어주면 됨.
	        	ProductDTO dto=mapper.getProductCodeByProductName(dib.getProduct());
	            ProductimgDTO img = mapper.findlistthum(dto.getCompanyid(),
	            		dto.getCategory(), dto.getCategory2());
	            if (img != null) {
	                // 이미지 경로 직접 조합하여 설정
	                String imagePath = "/resources/p_img/" + img.getCompanyid() +
	                                   img.getCategory() + img.getCategory2() +
	                                   img.getFlavor() + "F" + img.getNum() +
	                                   img.getExt();
	               imgPaths.add(imagePath);
	            }
	        }
	        model.addAttribute("wishList", dibs);
	        model.addAttribute("imgPaths", imgPaths);
	        model.addAttribute("folder",mapper.getWishFolderName(id));
	    }
	}

	@Override
	public void changeFolder(String checkedFolder, String products,String id) {
		String[] product1=products.split(",");
		for(String product:product1) {
			int num=Integer.parseInt(product);
			mapper.changeFolder(id,checkedFolder,num);
		}
	}
	
	
	
}
