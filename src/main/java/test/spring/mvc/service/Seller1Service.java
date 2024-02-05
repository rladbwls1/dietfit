package test.spring.mvc.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface Seller1Service {

    // 회사 ID로 전체 상품 조회
    public List<ProductDTO> findallproductbycompanyid(String companyid);

    // 현재 상품의 최대 시퀀스 번호 조회
    public int selectMaxProductSeq(String companyid);

    // 상품 저장
    public void insertProduct(ProductDTO productDTO, String companyid);
    
    // 상품 이미지 저장 
    public void insertProductimg(ProductimgDTO productimgDTO, String companyid);
    
    // 상품 이미지 파일 저장 
    public void fileUpload(String companyid, String category, String category2, String flavor, MultipartFile file, String path);

    // 상품 상세 정보 조회
    public ProductDTO findproductdetail(String companyid, String category, String category2, String flavor);

    // 상품 리스트 썸네일 조회
    public ProductimgDTO findlistthum(String companyid,String category, String category2);

    // 상품 상세 썸네일 조회
    public List<ProductimgDTO> findthumimg(String companyid, String category2, String category);

    // 상품 이미지 조회
    public List<ProductimgDTO> findimg(String companyid, String category, String category2);
        
    // 상품 정보 삭제
    public void deleteProduct(String companyid, String category, String category2, String flavor);
    
    // 상품 이미지 삭제 
    public void deleteProductimg(String companyid, String category, String category2, String flavor);
    
    // 상품 이미지 파일 삭제 
    public void fileDelete(String companyid, String category, String category2, String flavor, String path);
    
    // 상품 수정 이미지 가져오기
    public List<ProductimgDTO> updatethumimg (String companyid, String category, String category2,String flavor);
    public List<ProductimgDTO> updateimg (String companyid, String category, String category2,String flavor);
    
    // 상품 정보 수정
    public void updateProduct(ProductDTO productDTO);
    
    // 상품 이미지 DB 삭제
    public int deleteProductthumimg(List<Integer> thumnums);
    public int deleteProductimgnum(List<Integer> imgnums);

    // 상품 이미지 실제 파일
    // 썸네일
    public void fileDeletethumnum(List<String> thumfileNames,String path);
    // 첨부파일
    public void fileDeleteimgnum(List<String> imgfileName, String path);

    // 상품 이미지 수정 
    public void updatePrdouctimg(String companyid, String category, String category2, String flavor);
    
    // 상품 이미지 찾기 
    public List<ProductimgDTO> imgfindupdate(String companyid, String category, String category2, String flavor);
    
    //쿠키로 상품 정보 꺼내기
    public void getProductByCookie(List<String> recentlyViewedProducts,Model model);
}