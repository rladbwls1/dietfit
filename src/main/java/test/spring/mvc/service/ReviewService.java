package test.spring.mvc.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import test.spring.mvc.bean.AllimgDTO;
import test.spring.mvc.bean.ReviewDTO;

public interface ReviewService {
	// ���� ��ü ��
	public List<ReviewDTO> list();
		
	// ���� �̹���
	public List<AllimgDTO> img(int num);
	
	// ���� �� �ۼ�
	public ReviewDTO write(ReviewDTO rdto);
	// ���� �̹��� ����
	public AllimgDTO writeimg(AllimgDTO adto);
	// ���� ���� ���ε� 
	public String fileupload(MultipartFile file, String path);
}
