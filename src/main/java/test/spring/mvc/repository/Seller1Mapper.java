package test.spring.mvc.repository;

import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface Seller1Mapper {
	// ��ǰ �̹��� ������ 
    public int selectMaxProductSeq();
    // ��ǰ ���� ���� 
    public void insertProduct(ProductDTO productDTO);
    // ��ǰ �̹��� ����
    public void insertProductImage(ProductimgDTO productimgDTO);
    // ȸ�� ID ã�� 
    public String selectcompanyid(String companyid);
}
