package test.spring.mvc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.mvc.bean.AllimgDTO;
import test.spring.mvc.bean.RecommendDTO;
import test.spring.mvc.bean.ReviewDTO;

public interface ReviewMapper {
	// ���� �ۼ� ��ǰ
	public ReviewDTO writeproduct(ReviewDTO rdto);
	// ���� ����Ʈ
	public List<ReviewDTO> listimg();
	// ȸ���� �ۼ� ���� ����Ʈ
	public List<ReviewDTO> getListById(String id);
	
	// ���� �� ����
	public void write(ReviewDTO rdto);
	// ���� �̹��� ���� 
	public void writeimg(AllimgDTO adto);
	
    // ���� ��õ�ϱ�
    public void addRecommend(RecommendDTO dto);
    // ���� �� ��õ�� ����
    public void upRecommend(RecommendDTO dto);
    // ���� ��õ ����ϱ�
    public void removeRecommend(RecommendDTO dto);
    // ���� �� ��õ�� ����
    public void downRecommend(RecommendDTO dto);
	// �ش� ���� ��õ ���� �Ǵ�
    public List<Integer> getRecommend(String id);
	// ��ǰ ���� ��������
    public List<ReviewDTO> getReview(@Param("companyid")String companyid,@Param("category")String category,
    						@Param("category2")String category2,@Param("flavor")String flavor);
	// ���� ����
    public void delete(int num);
	// ���� �̹��� �����ϱ�
	
	
}
