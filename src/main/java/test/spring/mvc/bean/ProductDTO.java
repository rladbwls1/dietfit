package test.spring.mvc.bean;
import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProductDTO {
	private int num; 		// 번호
	private String boardname;	// 게시글명
	private String companyid;	// 업체ID
	private String category;	// 카테고리 소분류 
	private String category2;	// 임의번호 2자리
	private String flavor;		// 맛 분류
	private String detail;		// 상세설명
	private int isfile;			// 파일 갯수
	private String delivery;	// 배송정보
	private Date reg;			// 등록날짜
	private int count;			// 조회수
	private String product;		// 상품명
	private int stock;			// 재고수
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date expiry;		// 유통기한
	private String price;		// 가격
	private String imagePath;   // 이미지 경로 
	private int sale; // 할인율
	private List<ProductimgDTO> images; // 이미지 리스트
	
	private ProductimgDTO pimg;
	private ProductinfoDTO productinfo;
}
