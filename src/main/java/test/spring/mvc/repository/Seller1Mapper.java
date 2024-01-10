package test.spring.mvc.repository;

import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface Seller1Mapper {
	// 상품 이미지 시퀀스 
    public int selectMaxProductSeq();
    // 상품 정보 저장 
    public void insertProduct(ProductDTO productDTO);
    // 상품 이미지 저장
    public void insertProductImage(ProductimgDTO productimgDTO);
    // 회사 ID 찾기 
    public String selectcompanyid(String companyid);
}
