package test.spring.mvc.repository;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;

public interface Seller1Mapper {
    
    // ȸ�� ID�� ��ü ��ǰ 
    public List<ProductDTO> findallproductbycompanyid(String companyid);

    // ��ǰ �̹��� ������ 
    public int selectMaxProductSeq(String companyid);

    // ��ǰ ���� ���� 
    public void insertProduct(ProductDTO productDTO);

    // ��ǰ �̹��� ����
    public void insertProductImage(ProductimgDTO productimgDTO);

    // ��ǰ��
    public ProductDTO findproductdetail(@Param("companyid") String companyid, 
                                @Param("category") String category, 
                                @Param("category2") String category2, 
                                @Param("flavor") String flavor);

    // ��ǰ ����Ʈ ����� ��������
    public ProductimgDTO findlistthum(@Param("companyid") String companyid, 
    								  @Param("category") String category,
    								  @Param("category2") String category2);

    // ��ǰ �� ����� ��������
    public List<ProductimgDTO> findthumimg(@Param("companyid") String companyid, 
                                    	   @Param("category") String category,
                                    	   @Param("category2") String category2);

    // ��ǰ �� �̹��� ��������
    public List<ProductimgDTO> findimg(@Param("companyid") String companyid,
    								   @Param("category") String category,
                                       @Param("category2") String category2);
    
    // ��ǰ ���� ����
    public void deleteProduct(@Param("companyid") String companyid, 
							  @Param("category") String category,
					          @Param("category2") String category2,
					          @Param("flavor") String flavor);
    
    // ��ǰ �̹��� ���� 
    public void deleteProductimg(@Param("companyid") String companyid, 
							  	 @Param("category") String category,
							  	 @Param("category2") String category2,
							  	 @Param("flavor") String flavor);
    // ��ǰ ���� ����
    public void updateProduct(ProductDTO productDTO);
    
    // ��ǰ �̹��� ����� ����
    public int deleteProductthumimg(@Param("thumnums")  List<Integer> thumnum);

    // ��ǰ �̹��� ÷������ ����
    public int deleteProductimgnum(@Param("imgnums") List<Integer> imgnum);
    
    //allproduct���� num���� ��ǰ�ڵ� �ޱ�
    public ProductDTO getProductCodeByNum(int num);

    // ��ǳ ���� ����
    public void updateProductIsfile(ProductimgDTO dto);
    // �ش� �̹��� DB ���� 
    public void thumbnailDelete(int num);
    // ��ǰ �̹��� �� ���� ���� 
    public void productIsfileDelete(int num);
    // ��ü ȸ�� ���̵�
    public List<String> allmember();
}






