package test.spring.mvc.service;

import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface Seller1Service {
	// 회원 아이디로 회사 아이디 찾기
	public String selectcompanyid(String companyid);
	// 현재 상품의 최대 시퀀스 번호를 조회
	public int getMaxProductSeq();
	// 상품 저장
    public void insertProduct(ProductDTO productDTO, ProductimgDTO productimgDTO , String companyid);
}
