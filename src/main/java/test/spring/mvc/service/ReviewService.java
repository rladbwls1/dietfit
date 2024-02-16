package test.spring.mvc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import test.spring.mvc.bean.AllimgDTO;
import test.spring.mvc.bean.RecommendDTO;
import test.spring.mvc.bean.ReviewDTO;

public interface ReviewService {
	// ���� �ۼ� ��ǰ
	public ReviewDTO writeproduct(ReviewDTO rdto);
	// ���� ����Ʈ 
	public List<ReviewDTO> listimg();
	// ���� �� �ۼ�
	public void write(ReviewDTO rdto);
	// ���� �̹��� ����
	public void writeimg(AllimgDTO adto);
	// ���� ���� ���ε� 
	public String fileupload(MultipartFile file, String path);
    // ���� ��õ�ϱ�
	public void good(RecommendDTO recdto);
    // ���� �� ��õ�� ����
    public void goodreview(ReviewDTO rdto);
    // ���� ��õ ����ϱ�
    public void bye(RecommendDTO recdto);
}
