package test.spring.mvc.repository;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface Seller1Mapper {
    
    // 회사 ID로 전체 상품 
    public List<ProductDTO> findallproductbycompanyid(String companyid);

    // 상품 이미지 시퀀스 
    public int selectMaxProductSeq(String companyid);

    // 상품 정보 저장 
    public void insertProduct(ProductDTO productDTO);

    // 상품 이미지 저장
    public void insertProductImage(ProductimgDTO productimgDTO);

    // 상품상세
    public ProductDTO findproductdetail(@Param("companyid") String companyid, 
                                @Param("category") String category, 
                                @Param("category2") String category2, 
                                @Param("flavor") String flavor);

    // 상품 리스트 썸네일 가져오기
    public ProductimgDTO findlistthum(@Param("companyid") String companyid, 
    								  @Param("category") String category,
    								  @Param("category2") String category2);

    // 상품 상세 썸네일 가져오기
    public List<ProductimgDTO> findthumimg(@Param("companyid") String companyid, 
                                    	   @Param("category") String category,
                                    	   @Param("category2") String category2);

    // 상품 상세 이미지 가져오기
    public List<ProductimgDTO> findimg(@Param("companyid") String companyid,
    								   @Param("category") String category,
                                       @Param("category2") String category2);
    
    // 상품 정보 삭제
    public void deleteProduct(@Param("companyid") String companyid, 
							  @Param("category") String category,
					          @Param("category2") String category2,
					          @Param("flavor") String flavor);
    
    // 상품 이미지 삭제 
    public void deleteProductimg(@Param("companyid") String companyid, 
							  	 @Param("category") String category,
							  	 @Param("category2") String category2,
							  	 @Param("flavor") String flavor);
    // 상품 정보 수정
    public void updateProduct(ProductDTO productDTO);
    
    // 상품 이미지 썸네일 삭제
    public int deleteProductthumimg(@Param("thumnums")  List<Integer> thumnum);

    // 상품 이미지 첨부파일 삭제
    public int deleteProductimgnum(@Param("imgnums") List<Integer> imgnum);
    
    //allproduct에서 num으로 상품코드 받기
    public ProductDTO getProductCodeByNum(int num);

    // 상풍 수정 증가
    public void updateProductIsfile(ProductimgDTO dto);
    // 해당 이미지 DB 삭제 
    public void thumbnailDelete(int num);
    // 상품 이미지 총 갯수 삭제 
    public void productIsfileDelete(int num);
    // 전체 회원 아이디
    public List<String> allmember();
}






