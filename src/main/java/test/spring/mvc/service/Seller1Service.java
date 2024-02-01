package test.spring.mvc.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface Seller1Service {

    // ȸ�� ID�� ��ü ��ǰ ��ȸ
    public List<ProductDTO> findallproductbycompanyid(String companyid);

    // ���� ��ǰ�� �ִ� ������ ��ȣ ��ȸ
    public int selectMaxProductSeq(String companyid);

    // ��ǰ ����
    public void insertProduct(ProductDTO productDTO, String companyid);
    
    // ��ǰ �̹��� ���� 
    public void insertProductimg(ProductimgDTO productimgDTO, String companyid);
    
    // ��ǰ �̹��� ���� ���� 
    public void fileUpload(String companyid, String category, String category2, String flavor, MultipartFile file, String path);

    // ��ǰ �� ���� ��ȸ
    public ProductDTO findproductdetail(String companyid, String category, String category2, String flavor);

    // ��ǰ ����Ʈ ����� ��ȸ
    public ProductimgDTO findlistthum(String companyid,String category, String category2);

    // ��ǰ �� ����� ��ȸ
    public List<ProductimgDTO> findthumimg(String companyid, String category2, String category);

    // ��ǰ �̹��� ��ȸ
    public List<ProductimgDTO> findimg(String companyid, String category, String category2);
        
    // ��ǰ ���� ����
    public void deleteProduct(String companyid, String category, String category2, String flavor);
    
    // ��ǰ �̹��� ���� 
    public void deleteProductimg(String companyid, String category, String category2, String flavor);
    
    // ��ǰ �̹��� ���� ���� 
    public void fileDelete(String companyid, String category, String category2, String flavor, String path);
    
    // ��ǰ ���� �̹��� ��������
    public List<ProductimgDTO> updatethumimg (String companyid, String category, String category2,String flavor);
    public List<ProductimgDTO> updateimg (String companyid, String category, String category2,String flavor);
    
    // ��ǰ ���� ����
    public void updateProduct(ProductDTO productDTO);
    
    // ��ǰ �̹��� DB ����
    public int deleteProductthumimg(List<Integer> thumnums);
    public int deleteProductimgnum(List<Integer> imgnums);

    // ��ǰ �̹��� ���� ����
    // �����
    public void fileDeletethumnum(List<String> thumfileNames,String path);
    // ÷������
    public void fileDeleteimgnum(List<String> imgfileName, String path);

    // ��ǰ �̹��� ���� 
    public void updatePrdouctimg(String companyid, String category, String category2, String flavor);
    
    // ��ǰ �̹��� ã�� 
    public List<ProductimgDTO> imgfindupdate(String companyid, String category, String category2, String flavor);
    
    //��Ű�� ��ǰ ���� ������
    public void getProductByCookie(List<String> recentlyViewedProducts,Model model);
}