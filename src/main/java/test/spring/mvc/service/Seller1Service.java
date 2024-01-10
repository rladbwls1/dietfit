package test.spring.mvc.service;

import java.util.List;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface Seller1Service {

    // ȸ�� ID�� ��ü ��ǰ ��ȸ
    public List<ProductDTO> findallproductbycompanyid(String companyid);

    // ���� ��ǰ�� �ִ� ������ ��ȣ ��ȸ
    public int selectMaxProductSeq(String companyid);

    // ��ǰ ����
    public void insertProduct(ProductDTO productDTO, ProductimgDTO productimgDTO, String companyid);

    // ��ǰ �� ���� ��ȸ
    public ProductDTO findproductdetail(String companyid, String category, String category2, String flavor);

    // ��ǰ ����Ʈ ����� ��ȸ
    public ProductimgDTO findlistthum(String companyid,String category, String category2);

    // ��ǰ �� ����� ��ȸ
    public List<ProductimgDTO> findthumimg(String companyid, String category2);

    // ��ǰ �̹��� ��ȸ
    public List<ProductimgDTO> findimg(String companyid, String category2);
}
