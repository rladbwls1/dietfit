package test.spring.mvc.repository;

import java.util.List;

import test.spring.mvc.bean.AllimgDTO;
import test.spring.mvc.bean.ReviewDTO;

public interface ReviewMapper {
	// ���� ��ü ��
	public List<ReviewDTO> list();
	
	// ���� �̹���
	public List<AllimgDTO> img(int num);
	
	// ���� �� �ۼ�
	public ReviewDTO write(ReviewDTO rdto);
	
	public AllimgDTO writeimg(AllimgDTO adto);
}
