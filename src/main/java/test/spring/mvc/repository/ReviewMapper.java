package test.spring.mvc.repository;

import java.util.List;

import test.spring.mvc.bean.AllimgDTO;
import test.spring.mvc.bean.RecommendDTO;
import test.spring.mvc.bean.ReviewDTO;

public interface ReviewMapper {
<<<<<<< HEAD
	// ���� �ۼ� ��ǰ
	public ReviewDTO writeproduct(ReviewDTO rdto);
	// ���� ����Ʈ
=======
>>>>>>> branch 'main' of https://github.com/rladbwls1/dietfit.git
	public List<ReviewDTO> listimg();
	
	// ���� �� ����
	public void write(ReviewDTO rdto);
	// ���� �̹��� ���� 
	public void writeimg(AllimgDTO adto);
	
    // ���� ��õ�ϱ�
    public void good(RecommendDTO recdto);

    // ���� �� ��õ�� ����
    public void goodreview(ReviewDTO rdto);

    // ���� ��õ ����ϱ�
    public void bye(RecommendDTO recdto);
	
	
	// ���� ��õ ���̵𺰷� ã��
	// ���� ���� �����ϱ�
	// ���� �̹��� �����ϱ�
	
	
}
