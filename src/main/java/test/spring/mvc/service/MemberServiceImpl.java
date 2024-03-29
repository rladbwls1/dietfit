package test.spring.mvc.service;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
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

import test.spring.mvc.bean.AllcouponDTO;
import test.spring.mvc.bean.BuyproductDTO;
import test.spring.mvc.bean.CouponDTO;
import test.spring.mvc.bean.DeliveryDTO;
import test.spring.mvc.bean.DibsDTO;
import test.spring.mvc.bean.Member_basicDTO;
import test.spring.mvc.bean.Member_detailDTO;
import test.spring.mvc.bean.OrderdetailDTO;
import test.spring.mvc.bean.PointDTO;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.repository.MemberMapper;
import test.spring.mvc.repository.ReviewMapper;
import test.spring.mvc.repository.Seller1Mapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private Seller1Mapper sel1mapper;
	@Autowired
	private ReviewMapper rmapper;
		
	@Autowired
	PasswordEncoder encoder;
	
	//회원가입
	@Override
	@Transactional
	public void newMember(Member_basicDTO dto,int path) {
		dto.setPw(encoder.encode(dto.getPw()));		//비밀번호 암호화
		dto.setStatus(1);
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
	public void newMember2(Member_basicDTO bdto, Member_detailDTO ddto, int path) {
		bdto.setPw(encoder.encode(bdto.getPw()));		//비밀번호 암호화
		bdto.setStatus(800);
		ddto.setPath(path);
		mapper.newMember(bdto);							//member_basic 테이블 레코드 추가 
		mapper.newMemberstatus(bdto.getId());			//authoroties 테이블 레코드 추가 
		ddto.setId(bdto.getId());
		ddto.setPath(path);
		mapper.newMember3(ddto);
	}



	@Override
	public int registerEmailCheck(String email) {
		return mapper.registerEmailCheck(email);
	}
	
	//랜덤 비밀번호
	@Override
	public String getRamdomPassword() {
        char[] charSet = new char[] {
                'q', 'w', 'e', 'r', 't', 'y', 'u' , 'a', 's', 'd', 'f', 'g', 'h' , 'z', 'x', 'c', 'v', 'b', 'n' };
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
	public List<ProductDTO> findall() {
		return mapper.findall();
	}

	
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
	public void getallproduct(Model model, int currentPage, String orderBy) {
		int pageSize=16;
		int startRow=(currentPage-1)*pageSize+1;		//시작
		int endRow=currentPage*pageSize;				//끝
		int count=mapper.countAllProduct();
		List<Map<String,Object>> list = Collections.EMPTY_LIST;
		if("popular".equals(orderBy)) {
			list = mapper.popular(startRow,endRow);
		}else if("recent".equals(orderBy)) {
			list = mapper.findallproduct(startRow,endRow);
		}else if("priceHigh".equals(orderBy)) {
			list = mapper.priceHigh(startRow, endRow);
		}else if("priceLow".equals(orderBy)) {
			list = mapper.priceLow(startRow, endRow);
		}
	    if (list != null) {
	        for (Map<String,Object> map : list) {
	        	//썸네일
	        	ProductimgDTO img = mapper.findlistthum(map.get("COMPANYID").toString(),map.get("CATEGORY").toString(), map.get("CATEGORY2").toString());
	            if (img != null) {
	                // 이미지 경로 직접 조합하여 설정
	                String imagePath = "/resources/p_img/" + img.getCompanyid() +
	                                   img.getCategory() + img.getCategory2() +
	                                   img.getFlavor() + "F" + img.getNum() +
	                                   img.getExt();
	                map.put("IMAGEPATH",imagePath);
	            }
	            //기존 가격
	            int oriprice=Integer.parseInt(map.get("PRICE").toString());
	            //할인율
	            int num=Integer.parseInt(map.get("NUM").toString());
	            int sale=mapper.isSale(num);
	            if(sale!=0) {
	            	sale=mapper.getSaleByNum(num);
	            }
	            int price=oriprice*(100-sale)/100;
	            map.put("SALE", sale);
	            map.put("PRICE", price);
	            map.put("ORIPRICE", oriprice);
	        }
	        
	        
	        model.addAttribute("orderBy", orderBy);
	        model.addAttribute("products", list);
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
	    public void getcategoryproduct(Model model, int currentPage, String orderBy, String category) {
	    	int pageSize=16;
	    	int startRow=(currentPage-1)*pageSize+1;		//시작
	    	int endRow=currentPage*pageSize;				//끝
	    	int count=mapper.category_count(category + "%");
	    	List<Map<String,Object>> list = Collections.EMPTY_LIST;
	    	if("priceLow".equals(orderBy)) {
	    		list = mapper.cate_priceLow(startRow,endRow,category+"%");
	    	}else if("recent".equals(orderBy)) {
	    		list = mapper.cate_num(startRow, endRow, category+"%");
	    	}else if("priceHigh".equals(orderBy)) {
	    		list = mapper.cate_priceHigh(startRow, endRow, category+"%");
	    	}else if("popular".equals(orderBy)) {
	    		list = mapper.cate_popular(startRow, endRow,category+"%");
	    	}
	    	if (list != null) {
	    		for (Map<String,Object> map : list) {
	    			//썸네일
	    			ProductimgDTO img = mapper.findlistthum(map.get("COMPANYID").toString(),map.get("CATEGORY").toString(), map.get("CATEGORY2").toString());
	    			if (img != null) {
	    				// 이미지 경로 직접 조합하여 설정
	    				String imagePath = "/resources/p_img/" + img.getCompanyid() +
	    						img.getCategory() + img.getCategory2() +
	    						img.getFlavor() + "F" + img.getNum() +
	    						img.getExt();
	    				map.put("IMAGEPATH",imagePath);
	    			}
	    			//기존 가격
	    			int oriprice=Integer.parseInt(map.get("PRICE").toString());
	    			//할인율
	    			int num=Integer.parseInt(map.get("NUM").toString());
	    			int sale=mapper.isSale(num);
	    			if(sale!=0) {
	    				sale=mapper.getSaleByNum(num);
	    			}
	    			int price=oriprice*(100-sale)/100;
	    			map.put("SALE", sale);
	    			map.put("PRICE", price);
	    			map.put("ORIPRICE", oriprice);
	    		}
	    		
	    		
	    		model.addAttribute("category", category);
	    		model.addAttribute("orderBy", orderBy);
	    		model.addAttribute("products", list);
	    		model.addAttribute("count",count);
	    	}
	    //페이지
		int pageBlock=10;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		int startPage=(int)(currentPage%pageBlock==0?currentPage/pageBlock-1:currentPage/pageBlock)*pageBlock+1;
		int endPage=startPage + pageBlock - 1;

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
	    
	}

	@Override
	public List<String> getProductDetail(String companyid, String category, String category2, String flavor, Model model) {
		mapper.countUp(companyid,category,category2);
		
		Map<String,Object> product = mapper.findproductdetail(companyid, category, category2, flavor);

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
        //기존 가격
        int oriprice=Integer.parseInt(product.get("PRICE").toString());
        //할인율
        int num=Integer.parseInt(product.get("NUM").toString());
        int sale=mapper.isSale(num);
        if(sale!=0) {
        	sale=mapper.getSaleByNum(num);
        }
        int price=oriprice*(100-sale)/100;
        product.put("SALE", sale);
        product.put("PRICE", price);
        product.put("ORIPRICE", oriprice);
        
        // 모델에 추가
        model.addAttribute("product", product);
        model.addAttribute("thumbnailPaths", thumbnailPaths);
        model.addAttribute("imagePaths", imagePaths);
        return thumbnailPaths;
	}

	@Override
	public void addWishOne(String product,String id) {
		if(mapper.isWish(product,id)==0) {
			mapper.addWishOne(product,id);
		}
	}

	@Override
	public void getWishListProduct(Model model, String id) {
		if(mapper.getStatusById(id)==1) {
			model.addAttribute("wishList",mapper.getWishListProduct(id));
		}
	}

	@Override
	public void removeWishOne(String product, String id) {
		mapper.removeWishOne(product,id);
	}

	@Override
	public void removeWishMore(String products, String id,String checkedFolder) {
		String[] product1=products.split(",");
		String removeFolder=checkedFolder;
		for (String num1 : product1) {
			int num=Integer.parseInt(num1);
			//폴더가 전체인 경우 목록에서 바로 제거
			if(checkedFolder.equals("전체")) {
				mapper.removeWishOneByNum(num,id);
			}else {
				//폴더에서 삭제한 경우 폴더에서만 삭제 
				String Folder=mapper.getFolderByNum(num,id);
				//선택 상품이 여러 폴더에 담겨있는 경우 삭제하려는 폴더에서만 삭제
				if(Folder.contains(",")) {
					String[] folderarray=Folder.split(",");
					List<String> folderList= new ArrayList<>(Arrays.asList(folderarray));
					folderList.remove(removeFolder);
					checkedFolder=String.join(",", folderList);
					mapper.changeFolder(id, checkedFolder, num);
				}else {
					//선택 상품이 하나의 폴더에만 담겨있는 경우 목록에서 제거
					mapper.removeWishOneByNum(num,id);
				}
			}
		}
	}

	@Override
	public void getWishList(Model model, String id,int currentPage,String checkedFolder) {
		int pageSize=5;
		int startRow=(currentPage-1)*pageSize+1;		//시작
		int endRow=currentPage*pageSize;				//끝
		int count=mapper.countWishList(id);
		List<DibsDTO> dibs=mapper.getWishList(id, startRow, endRow);
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
	            }else {
	            	imgPaths.add("/resources/p_img/free-icon-image-10701484.png");
	            }
	        }
	        model.addAttribute("wishList", dibs);
	        model.addAttribute("imgPaths", imgPaths);
	        List<String> folder1=new ArrayList<>(mapper.getWishFolderName(id));
	        List<String> folder2=new ArrayList<>();
	        for(String folder:folder1) {
	        	String[] names=folder.split(",");
	        	for(String name:names) {
	        		if(!folder2.contains(name)) {
	        			folder2.add(name);
	        		}
	        	}
	        }
	        model.addAttribute("folder",folder2);
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
	public void getWishListWithFolder(Model model, String id, int currentPage, String checkedFolder) {
		int pageSize=5;
		int startRow=(currentPage-1)*pageSize+1;		//시작
		int endRow=currentPage*pageSize;				//끝
		//int count=mapper.countWishList(id);
		int count=0;
		List<DibsDTO> oridibs=mapper.getWishListWithFolder(id);
		List<DibsDTO> dibs=new ArrayList<>();
		List<DibsDTO> dibs2=new ArrayList<>();
		List<String> imgPaths=new ArrayList<>();
	    if (oridibs != null) {
	    	//폴더의 상품 개수
    		for(DibsDTO dib:oridibs) {
    			String folderName=dib.getFolder();
    			for(String fName:folderName.split(",")) {
    				if(fName.equals(checkedFolder)){
    					dibs.add(dib);
    					count++;
    				}
    			}
    		}
    		int startNum=pageSize*currentPage-pageSize;
    		for(int i=0;i<pageSize;i++) {
    			if((i+startNum)>=count) {break;}
    			dibs2.add(dibs.get(i+startNum));
    		}
	        for (DibsDTO dib: dibs2) {
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
	            }else {
	            	imgPaths.add("/resources/p_img/free-icon-image-10701484.png");
	            }
	        }
	        model.addAttribute("wishList", dibs2);
	        model.addAttribute("imgPaths", imgPaths);
	        List<String> folder1=new ArrayList<>(mapper.getWishFolderName(id));
	        List<String> folder2=new ArrayList<>();
	        for(String folder:folder1) {
	        	String[] names=folder.split(",");
	        	for(String name:names) {
	        		if(!folder2.contains(name)) {
	        			folder2.add(name);
	        		}
	        	}
	        }
	        model.addAttribute("folder",folder2);
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
	public void changeFolder(String checkedFolder, String products,String id) {
		String[] product1=products.split(",");
		for(String product:product1) {
			int num=Integer.parseInt(product);
			mapper.changeFolder(id,checkedFolder,num);
		}
	}

	@Override
	public void addCartOne(String id, String product, int quantity, int price, int delivery) {
		int check=mapper.isCart(id, product);
		if(check==0) {
			mapper.addCartOne(id, product, quantity, price, delivery);
		}
	}

	@Override
	public void addCartMore(String id, String products) {
		for(String num:products.split(",")) {
			String product=mapper.getProductByNum(id, Integer.parseInt(num));
			int price=mapper.getPriceByProductName(product);
			addCartOne(id,product,1,price,0);
		}
	}
	
	@Override
	public void miniCart(int num, Model model) {
		model.addAttribute("pmap",mapper.getMiniCartByNum(num));
	}

	@Override
	public void getCartList(Model model, String id) {
		List<Map<String,Object>> list=mapper.getCartList(id);
		List<String> imgPaths=new ArrayList<>();
		if(list!=null) {
			for(Map<String,Object> map:list) {
				//썸네일 처리
				ProductDTO pdto=mapper.getProductCodeByProductName(map.get("PRODUCT").toString());
				ProductimgDTO img =mapper.findlistthum(pdto.getCompanyid(), pdto.getCategory(), pdto.getCategory2());
				if (img != null) {
					// 이미지 경로 직접 조합하여 설정
					String imagePath = "/resources/p_img/" + img.getCompanyid() +
							img.getCategory() + img.getCategory2() +
							img.getFlavor() + "F" + img.getNum() +
							img.getExt();
					imgPaths.add(imagePath);
					
				}else {
					imgPaths.add("/resources/p_img/free-icon-image-10701484.png");
				}
				//가격
				int oriPrice=mapper.getPriceByProductName(map.get("PRODUCT").toString());
				map.put("ORIPRICE",oriPrice);
				//할인율
				int num=mapper.getNumByProduct(map.get("PRODUCT").toString());
				int sale=mapper.isSale(num);
				if(sale==1) {
					sale=mapper.getSaleByNum(num);
				}
				map.put("SALE",sale);
				
				//할인된 가격
				int price=oriPrice*(100-sale)/100;
				map.put("PRICE", price);
			}
			model.addAttribute("list",list);
			model.addAttribute("imgPaths",imgPaths);
		}
	}

	@Override
	public void updateCartQuantity(String id,int num, int quantity) {
		mapper.updateCart(id, quantity, num);
	}

	@Override
	public void deleteCart(String id, int num) {
		mapper.deleteCart(id, num);
	}

	@Override
	public void addDelivery(DeliveryDTO dto, String id) {
		mapper.addDelivery(dto,id);
	}

	@Override
	public void setDefaultDelivery(String id, String nicaddr) {
		mapper.removeDefaultDelivery(id);
		mapper.setDefaultDelivery(id,nicaddr);
	}

	@Override
	public void deleteDelivery(String id, String nicaddr) {
		mapper.deleteDelivery(id,nicaddr);
	}
	
	//쿠폰
	@Override
	public int couponcount() {
		return mapper.couponcount();
	}

	@Override
	public void couponList(Model model) {
		int couponcount = mapper.couponcount();
		List<AllcouponDTO> couponList = Collections.EMPTY_LIST;
		couponList = mapper.couponList();
		model.addAttribute("couponcount", couponcount);
		model.addAttribute("couponList", couponList);
	}

	@Override
	public void downloadCoupon(String id, CouponDTO cdto) {
		mapper.downloadCoupon(id,cdto);
	}

	@Override
	public List<CouponDTO> getUserCoupon(String id) {
		mapper.checkUsableCoupon(id);
		return mapper.getUserCoupon(id);
	}

	@Override
	public void getUserOrder(String id,Model model) {
		List<Map<String,Object>> list=mapper.getUserOrder(id);
		ProductDTO dto=new ProductDTO();
		List<String> imgPaths=new ArrayList<>();
		for(Map<String,Object> map:list) {
			String productid=map.get("PRODUCTID").toString();
			dto.setCompanyid(productid.substring(0,2));
			dto.setCategory(productid.substring(2,4));
			dto.setCategory2(productid.substring(4,6));
			dto.setFlavor(productid.substring(6,8));
			map.put("PRODUCT", mapper.getProductnameByProductcode(dto));
			//썸네일
			ProductimgDTO img =mapper.findlistthum(dto.getCompanyid(), dto.getCategory(), dto.getCategory2());
			if (img != null) {
				// 이미지 경로 직접 조합하여 설정
				String imagePath = "/resources/p_img/" + img.getCompanyid() +
						img.getCategory() + img.getCategory2() +
						img.getFlavor() + "F" + img.getNum() +
						img.getExt();
				imgPaths.add(imagePath);
				
			}else {
				imgPaths.add("/resources/p_img/free-icon-image-10701484.png");
			}
			
		}
		
		model.addAttribute("imgPaths",imgPaths);
		model.addAttribute("list",list);
	}

	@Override
	public void getOrderDetailByOrderid(String id, String orderid, Model model) {
		List<OrderdetailDTO> list=mapper.getOrderDetailByOrderid(id, orderid);
		List<Integer> reviewable=new ArrayList<>(); 
		List<String> imgPaths=new ArrayList<>();
		ProductDTO dto=new ProductDTO();
		for(OrderdetailDTO odto:list) {
			String productid=odto.getProductid();
			dto.setCompanyid(productid.substring(0,2));
			dto.setCategory(productid.substring(2,4));
			dto.setCategory2(productid.substring(4,6));
			dto.setFlavor(productid.substring(6,8));
			odto.setProduct(mapper.getProductnameByProductcode(dto));
			//리뷰 작성 여부 판단
			dto.setBoardname(orderid);
			reviewable.add(mapper.isReviewByOrderidAndProductcode(dto));
			
			//썸네일
			ProductimgDTO img =mapper.findlistthum(dto.getCompanyid(), dto.getCategory(), dto.getCategory2());
			if (img != null) {
				// 이미지 경로 직접 조합하여 설정
				String imagePath = "/resources/p_img/" + img.getCompanyid() +
						img.getCategory() + img.getCategory2() +
						img.getFlavor() + "F" + img.getNum() +
						img.getExt();
				imgPaths.add(imagePath);
				
			}else {
				imgPaths.add("/resources/p_img/free-icon-image-10701484.png");
			}
			
		}
		
		
		model.addAttribute("list",list);
		model.addAttribute("reviewable",reviewable);
		model.addAttribute("imgPaths",imgPaths);
	}

	@Override
	@Transactional
	public void defintePurchase(String id, String orderid, String productid,int price) {
		//orderdetail 컬럼 변경
		mapper.defintePurchase(id,orderid,productid);
		
		//적립금 추가
		int point=getPoint(id);					//회원 보유 적립금 가져오기
		double bonus=mapper.getBonus(id);		//회원 등급에 따른 적립 정도
		int change=(int)(price*bonus);			//적립금
		PointDTO dto=new PointDTO();
		dto.setChange(change);
		dto.setPoint(point+change);
		dto.setOrderid(orderid);
		mapper.addPoint(id, dto);

		//buyproduct 에 레코드 추가 
		BuyproductDTO bdto=new BuyproductDTO();
		bdto.setCompanyid(productid.substring(0,2));
		bdto.setCategory(productid.substring(2,4));
		bdto.setCategory2(productid.substring(4,6));
		bdto.setFlavor(productid.substring(6,8));
		bdto.setId(id);
		bdto.setOrderid(orderid);
		OrderdetailDTO odto=mapper.getOrderDetailByOrderidAndProductid(id, orderid, productid);
		bdto.setPrice(odto.getPrice());
		bdto.setQuantity(odto.getQuantity());
		mapper.addDefintePurchaseToBuyproduct(bdto);
		
	}
	//회원 보유 적립금 가져오기
	@Override
	public int getPoint(String id) {
		//소멸은 나중에 
		//적립금 사용or 확인할 때 만료된 거 만료 처리
//		List<PointDTO> dtos=mapper.getDuePointNum(id);
//		if(dtos!=null) {
//		for(PointDTO dto:dtos) {
//			int point=mapper.getPoint(id);
//			dto.setOpt(1);
//			dto.setPoint(point-dto.getChange());
//			mapper.deletePoint(id,dto);
//		}}
		
		//보유 적립금 가져오기
		int point=0;
		if(mapper.isPoint(id)>1) {
			point=mapper.getPoint(id);
		}
		return point;
	}
	
	//적립금 사용
	@Override
	public void usePoint(String id,String orderid, int point) {
		int expoint=getPoint(id);
		PointDTO pdto=new PointDTO();
		pdto.setChange(point);
		pdto.setPoint(expoint-point);
		pdto.setOrderid(orderid);
		mapper.usePoint(id, pdto);
	}
	
	//최근 본 상품
	@Override
	public void getProductByCookie(List<String> recentlyViewedProducts,Model model) {
		List<ProductDTO> list=new ArrayList<>();
		for(String ProductCode:recentlyViewedProducts) {
			String companyid=ProductCode.substring(0,2);
			String category=ProductCode.substring(2,4);
			String category2=ProductCode.substring(4,6);
			String flavor=ProductCode.substring(6,8);
			
			String product = sel1mapper.findproductdetail(companyid, category, category2, flavor).getProduct();
			String price = sel1mapper.findproductdetail(companyid, category, category2, flavor).getPrice();
			ProductimgDTO thumbnailPath = mapper.findlistthum(companyid, category, category2);
			
			// ProductDTO 객체 생성 및 정보 설정
	        ProductDTO ProductDTO = new ProductDTO();
	        ProductDTO.setCompanyid(companyid);
	        ProductDTO.setCategory(category);
	        ProductDTO.setCategory2(category2);
	        ProductDTO.setFlavor(flavor);
			ProductDTO.setProduct(product);
			ProductDTO.setPrice(price);
			// 이미지 경로 직접 조합하여 설정
			if(thumbnailPath!=null) {
			String imagePath = "/resources/p_img/" + thumbnailPath.getCompanyid() +
					thumbnailPath.getCategory() + thumbnailPath.getCategory2() +
					thumbnailPath.getFlavor() + "F" + thumbnailPath.getNum() +
					thumbnailPath.getExt();
			ProductDTO.setImagePath(imagePath);
			}
			
			//썸네일, 이름, 가격 꺼내
			//list.add(ProductDTO);
			//product를 메퍼로 불러오고
			//썸네일도 불러와서 이미지 패스 넣어라
			list.add(ProductDTO);
		}
		
		model.addAttribute("list",list);
	}

	@Override
	public void getProductBySearch(Model model, int currentPage, String keyword) {
		int pageSize=16;
    	int startRow=(currentPage-1)*pageSize+1;		//시작
    	int endRow=currentPage*pageSize;				//끝
    	int count=mapper.countSearch("%"+keyword+"%");
    	List<Map<String,Object>> list=mapper.getProductBySearch("%"+keyword+"%",startRow,endRow);
    	
    	if (list != null) {
    		for (Map<String,Object> map : list) {
    			//썸네일
    			ProductimgDTO img = mapper.findlistthum(map.get("COMPANYID").toString(),map.get("CATEGORY").toString(), map.get("CATEGORY2").toString());
    			if (img != null) {
					// 이미지 경로 직접 조합하여 설정
					String imagePath = "/resources/p_img/" + img.getCompanyid() +
							img.getCategory() + img.getCategory2() +
							img.getFlavor() + "F" + img.getNum() +
							img.getExt();
					map.put("IMAGEPATH",imagePath);
					
				}else {
					map.put("IMAGEPATH","/resources/p_img/free-icon-image-10701484.png");
				}
    			//기존 가격
    			int oriprice=Integer.parseInt(map.get("PRICE").toString());
    			//할인율
    			int num=Integer.parseInt(map.get("NUM").toString());
    			int sale=mapper.isSale(num);
    			if(sale!=0) {
    				sale=mapper.getSaleByNum(num);
    			}
    			int price=oriprice*(100-sale)/100;
    			map.put("SALE", sale);
    			map.put("PRICE", price);
    			map.put("ORIPRICE", oriprice);
    			
    			model.addAttribute("list",list);
    		}
    		
    		int pageBlock=10;
    		int pageCount=count/pageSize+(count%pageSize==0?0:1);
    		int startPage=(int)(currentPage%pageBlock==0?currentPage/pageBlock-1:currentPage/pageBlock)*pageBlock+1;
    		int endPage=startPage + pageBlock - 1;

    		model.addAttribute("pageNum",currentPage);
    		model.addAttribute("currentPage",currentPage);
    		model.addAttribute("pageSize",pageSize);
    		model.addAttribute("pageCount",pageCount);
    		model.addAttribute("startPage",startPage);
    		model.addAttribute("endPage",endPage);
    	}
    	model.addAttribute("count",count);
    	model.addAttribute("keyword",keyword);
	}
	
}
