package test.spring.mvc.service;

import java.util.List;

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
    public void fileUpload(String companyid, String category, String category2, String flavor, MultipartFile file);

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
    public void fileDelete(String companyid, String category, String category2, String flavor);
    
    // 상품 정보 수정
    public void updateProduct(ProductDTO productDTO);
    
    // 상품 이미지 찾기 
    public List<ProductimgDTO> imgfindupdate(String companyid, String category, String category2, String flavor);
    
    // 상품 이름
    String filename(String companyid, String category, String category2, String flavor, String ext, int num);
}