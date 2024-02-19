package test.spring.mvc.repository;

import java.util.List;

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
	// �ش� ���� ��õ ���� �Ǵ�
    public List<Integer> getRecommend(String id);
	
    
    
	// ���� ���� �����ϱ�
	// ���� �̹��� �����ϱ�
	
	
}
