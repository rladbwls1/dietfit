package test.spring.mvc.service;

import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface Seller1Service {
	// ȸ�� ���̵�� ȸ�� ���̵� ã��
	public String selectcompanyid(String companyid);
	// ���� ��ǰ�� �ִ� ������ ��ȣ�� ��ȸ
	public int getMaxProductSeq();
	// ��ǰ ����
    public void insertProduct(ProductDTO productDTO, ProductimgDTO productimgDTO , String companyid);
}
