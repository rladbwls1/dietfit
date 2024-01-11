package test.spring.mvc.service;

import java.util.List;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface Seller1Service {

    // 회사 ID로 전체 상품 조회
    public List<ProductDTO> findallproductbycompanyid(String companyid);

    // 현재 상품의 최대 시퀀스 번호 조회
    public int selectMaxProductSeq(String companyid);

    // 상품 저장
    public void insertProduct(ProductDTO productDTO, ProductimgDTO productimgDTO, String companyid);

    // 상품 상세 정보 조회
    public ProductDTO findproductdetail(String companyid, String category, String category2, String flavor);

    // 상품 리스트 썸네일 조회
    public ProductimgDTO findlistthum(String companyid,String category, String category2);

    // 상품 상세 썸네일 조회
    public List<ProductimgDTO> findthumimg(String companyid, String category2);

    // 상품 이미지 조회
    public List<ProductimgDTO> findimg(String companyid, String category2);
}
