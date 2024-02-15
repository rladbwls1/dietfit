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
import test.spring.mvc.bean.CartDTO;
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
import test.spring.mvc.repository.Seller1Mapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private Seller1Mapper sel1mapper;
		
	@Autowired
	PasswordEncoder encoder;
	
	//ȸ������
	@Override
	@Transactional
	public void newMember(Member_basicDTO dto,int path) {
		dto.setPw(encoder.encode(dto.getPw()));		//��й�ȣ ��ȣȭ
		mapper.newMember(dto);						//member_basic ���̺� ���ڵ� �߰� 
		mapper.newMemberstatus(dto.getId());		//authoroties ���̺� ���ڵ� �߰� 
		Member_detailDTO dto2=new Member_detailDTO();
		dto2.setId(dto.getId());
		dto2.setPath(path);
		mapper.newMember2(dto2);					//member_detail ���̺� ���ڵ� �߰� 
		//������ ȸ�� ���̺� ����
		mapper.newPointSeq(dto.getId());
		mapper.newPoint(dto.getId());
		//���� ȸ�� ���̺� ����
		mapper.newCouponSeq(dto.getId());
		mapper.newCoupon(dto.getId());
		//�� ȸ�� ���̺� ����
		mapper.newDibsSeq(dto.getId());
		mapper.newDibs(dto.getId());
		//��ٱ��� ȸ�� ���̺� ����
		mapper.newCartSeq(dto.getId());
		mapper.newCart(dto.getId());
		//�ֹ��� ȸ�� ���̺� ����
		mapper.newOrderdetail(dto.getId());
		//������� ȸ�� ���̺� ����
		mapper.newDelivery(dto.getId());
	}

	@Override
	public int registerEmailCheck(String email) {
		return mapper.registerEmailCheck(email);
	}
	
	//���� ��й�ȣ
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

        // SMTP �������� ����
        Properties props = new Properties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");

        // ������ ��� ���� ���� ����
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        // ���� ����
        String emailkey=getRamdomPassword();
        String subject = "�̸��� ������ ���� ������ȣ�� �ȳ� �帳�ϴ�.";
        String text = "<div>"
        	    + "<h1 style='color: #333366;'>Dietfit �̸��� ���� �ȳ�</h1>" 
        		+ "<br /><p>"
        		 + "�ȳ��ϼ���, ȸ�������� ���� �̸��� ������ �����մϴ�. </p>"
        	     + "<hr/><p> ������ȣ: "+ emailkey+"</p>"
        	     + "<hr/></div>";

        // ���� ���� �ۼ�
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(from));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
        msg.setSubject(subject);
        msg.setContent(text, "text/html; charset=utf-8"); // html ������ ���ؼ�

        // ���� ������
        Transport.send(msg);
        
        //DB�� ����
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
	public void getallproduct(Model model, int currentPage) {
		int pageSize=10;
		int startRow=(currentPage-1)*pageSize+1;		//����
		int endRow=currentPage*pageSize;				//��
		int count=mapper.countAllProduct();
		List<ProductDTO> products = mapper.findallproduct(startRow,endRow);
	    if (products != null) {
	        for (ProductDTO product : products) {
	            ProductimgDTO img = mapper.findlistthum(product.getCompanyid(),product.getCategory(), product.getCategory2());
	            if (img != null) {
	                // �̹��� ��� ���� �����Ͽ� ����
	                String imagePath = "/resources/p_img/" + img.getCompanyid() +
	                                   img.getCategory() + img.getCategory2() +
	                                   img.getFlavor() + "F" + img.getNum() +
	                                   img.getExt();
	               product.setImagePath(imagePath);
	            }
	        }
	        model.addAttribute("products", products);
	    }
	    //������
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
	public List<String> getProductDetail(String companyid, String category, String category2, String flavor, Model model) {
		mapper.countUp(companyid,category,category2);
		
		ProductDTO product = sel1mapper.findproductdetail(companyid, category, category2, flavor);

        // ����� �̹��� ������ ������
        List<ProductimgDTO> thumbnails = sel1mapper.findthumimg(companyid, category, category2);

        // ��ǥ �̹��� ������ ������
        List<ProductimgDTO> images = sel1mapper.findimg(companyid, category, category2);

        List<String> thumbnailPaths = new ArrayList<>();
        List<String> imagePaths = new ArrayList<>();

        // ����� �̹��� ��ε��� ����
        for (ProductimgDTO thumbnail : thumbnails) {
            String path = "/resources/p_img/" + thumbnail.getCompanyid() +
                          thumbnail.getCategory() + thumbnail.getCategory2() +
                          thumbnail.getFlavor() + "F" + thumbnail.getNum() +
                          thumbnail.getExt();
            thumbnailPaths.add(path);
        }

        // ��ǥ �̹��� ��ε��� ����
        for (ProductimgDTO image : images) {
            String path = "/resources/p_img/" + image.getCompanyid() +
                          image.getCategory() + image.getCategory2() +
                          image.getFlavor() + "F" + image.getNum() +
                          image.getExt();
            imagePaths.add(path);
        }

        // �𵨿� �߰�
        model.addAttribute("product", product);
        model.addAttribute("thumbnailPaths", thumbnailPaths);
        model.addAttribute("imagePaths", imagePaths);
        return thumbnailPaths;
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
		for (String num1 : product1) {
			int num=Integer.parseInt(num1);
			//������ ��ü�� ��� ��Ͽ��� �ٷ� ����
			if(checkedFolder.equals("��ü")) {
				mapper.removeWishOneByNum(num,id);
			}else {
				//�������� ������ ��� ���������� ���� 
				String Folder=mapper.getFolderByNum(num,id);
				//���� ��ǰ�� ���� ������ ����ִ� ��� �����Ϸ��� ���������� ����
				if(Folder.contains(",")) {
					String[] folderarray=Folder.split(",");
					List<String> folderList= new ArrayList<>(Arrays.asList(folderarray));
					folderList.remove(removeFolder);
					checkedFolder=String.join(",", folderList);
					mapper.changeFolder(id, checkedFolder, num);
				}else {
					//���� ��ǰ�� �ϳ��� �������� ����ִ� ��� ��Ͽ��� ����
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
	        	//��ǰ������ ������̵�, ��з�, �Һз� ã�Ƽ� �� �־��ָ� ��.
	        	ProductDTO dto=mapper.getProductCodeByProductName(dib.getProduct());
	            ProductimgDTO img = mapper.findlistthum(dto.getCompanyid(),
	            		dto.getCategory(), dto.getCategory2());
	            if (img != null) {
	                // �̹��� ��� ���� �����Ͽ� ����
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
		for(Map<String,Object> map:list) {
			//����� ó��
			ProductDTO pdto=mapper.getProductCodeByProductName(map.get("PRODUCT").toString());
			ProductimgDTO img =mapper.findlistthum(pdto.getCompanyid(), pdto.getCategory(), pdto.getCategory2());
            if (img != null) {
                // �̹��� ��� ���� �����Ͽ� ����
                String imagePath = "/resources/p_img/" + img.getCompanyid() +
                                   img.getCategory() + img.getCategory2() +
                                   img.getFlavor() + "F" + img.getNum() +
                                   img.getExt();
                imgPaths.add(imagePath);
                
            }else {
            	imgPaths.add("/resources/p_img/free-icon-image-10701484.png");
            }
            //����
            int oriPrice=mapper.getPriceByProductName(map.get("PRODUCT").toString());
            map.put("ORIPRICE",oriPrice);
            //������
            int num=mapper.getNumByProduct(map.get("PRODUCT").toString());
            int sale=mapper.isSale(num);
            if(sale==1) {
            	sale=mapper.getSaleByNum(num);
            }
            map.put("SALE",sale);
            
            //���ε� ����
            int price=oriPrice*(100-sale)/100;
            map.put("PRICE", price);
		}
		model.addAttribute("list",list);
		model.addAttribute("imgPaths",imgPaths);
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
	
	//����
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
		for(Map<String,Object> map:list) {
			String productid=map.get("PRODUCTID").toString();
			dto.setCompanyid(productid.substring(0,2));
			dto.setCategory(productid.substring(2,4));
			dto.setCategory2(productid.substring(4,6));
			dto.setFlavor(productid.substring(6,8));
			map.put("PRODUCT", mapper.getProductnameByProductcode(dto));
		}
		model.addAttribute("list",list);
	}

	@Override
	public void getOrderDetailByOrderid(String id, String orderid, Model model) {
		List<OrderdetailDTO> list=mapper.getOrderDetailByOrderid(id, orderid);
		ProductDTO dto=new ProductDTO();
		for(OrderdetailDTO odto:list) {
			String productid=odto.getProductid();
			dto.setCompanyid(productid.substring(0,2));
			dto.setCategory(productid.substring(2,4));
			dto.setCategory2(productid.substring(4,6));
			dto.setFlavor(productid.substring(6,8));
			odto.setProduct(mapper.getProductnameByProductcode(dto));
		}
		model.addAttribute("list",list);
	}

	@Override
	@Transactional
	public void defintePurchase(String id, String orderid, String productid,int price) {
		//orderdetail �÷� ����
		mapper.defintePurchase(id,orderid,productid);
		
		//������ �߰�
		int point=getPoint(id);					//ȸ�� ���� ������ ��������
		double bonus=mapper.getBonus(id);		//ȸ�� ��޿� ���� ���� ����
		int change=(int)(price*bonus);			//������
		PointDTO dto=new PointDTO();
		dto.setChange(change);
		dto.setPoint(point+change);
		dto.setOrderid(orderid);
		mapper.addPoint(id, dto);

		//buyproduct �� ���ڵ� �߰� 
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
	//ȸ�� ���� ������ ��������
	@Override
	public int getPoint(String id) {
		//�Ҹ��� ���߿� 
		//������ ���or Ȯ���� �� ����� �� ���� ó��
//		List<PointDTO> dtos=mapper.getDuePointNum(id);
//		if(dtos!=null) {
//		for(PointDTO dto:dtos) {
//			int point=mapper.getPoint(id);
//			dto.setOpt(1);
//			dto.setPoint(point-dto.getChange());
//			mapper.deletePoint(id,dto);
//		}}
		
		//���� ������ ��������
		int point=0;
		if(mapper.isPoint(id)>1) {
			point=mapper.getPoint(id);
		}
		return point;
	}
	
	//������ ���
	@Override
	public void usePoint(String id,String orderid, int point) {
		int expoint=getPoint(id);
		PointDTO pdto=new PointDTO();
		pdto.setChange(point);
		pdto.setPoint(expoint-point);
		pdto.setOrderid(orderid);
		mapper.usePoint(id, pdto);
	}
	
	//�ֱ� �� ��ǰ
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
			
			// ProductDTO ��ü ���� �� ���� ����
	        ProductDTO ProductDTO = new ProductDTO();
	        ProductDTO.setCompanyid(companyid);
	        ProductDTO.setCategory(category);
	        ProductDTO.setCategory2(category2);
	        ProductDTO.setFlavor(flavor);
			ProductDTO.setProduct(product);
			ProductDTO.setPrice(price);
			// �̹��� ��� ���� �����Ͽ� ����
			if(thumbnailPath!=null) {
			String imagePath = "/resources/p_img/" + thumbnailPath.getCompanyid() +
					thumbnailPath.getCategory() + thumbnailPath.getCategory2() +
					thumbnailPath.getFlavor() + "F" + thumbnailPath.getNum() +
					thumbnailPath.getExt();
			ProductDTO.setImagePath(imagePath);
			}
			
			//�����, �̸�, ���� ����
			//list.add(ProductDTO);
			//product�� ���۷� �ҷ�����
			//����ϵ� �ҷ��ͼ� �̹��� �н� �־��
			list.add(ProductDTO);
		}
		
		model.addAttribute("list",list);
	}

	
	
	
	
	
	
}
