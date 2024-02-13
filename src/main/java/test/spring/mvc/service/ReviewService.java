package test.spring.mvc.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import test.spring.mvc.bean.AllimgDTO;
import test.spring.mvc.bean.ReviewDTO;

public interface ReviewService {
	// ���� ����Ʈ 
	public List<ReviewDTO> listimg();
	// ���� �� �ۼ�
	public void write(ReviewDTO rdto);
	// ���� �̹��� ����
	public void writeimg(AllimgDTO adto);
	// ���� ���� ���ε� 
	public String fileupload(MultipartFile file, String path);

}
