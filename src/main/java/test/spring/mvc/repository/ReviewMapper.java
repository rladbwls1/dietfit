package test.spring.mvc.repository;

import java.util.List;

import test.spring.mvc.bean.AllimgDTO;
import test.spring.mvc.bean.ReviewDTO;

public interface ReviewMapper {
	public List<ReviewDTO> listimg();
	
	// ���� �� ����
	public void write(ReviewDTO rdto);
	// ���� �̹��� ���� 
	public void writeimg(AllimgDTO adto);
}
