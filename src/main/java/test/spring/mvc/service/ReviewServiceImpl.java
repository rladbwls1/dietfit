package test.spring.mvc.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import test.spring.mvc.bean.AllimgDTO;
import test.spring.mvc.bean.ReviewDTO;
import test.spring.mvc.repository.ReviewMapper;


@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public List<ReviewDTO> listimg() {
		return mapper.listimg();
	}

	@Override
	public void write(ReviewDTO rdto) {
		mapper.write(rdto);
		
	}
	
	@Override
	public void writeimg(AllimgDTO adto) {
		mapper.writeimg(adto);
	}
	
	@Override
	public String fileupload(MultipartFile file, String path) {
	    String originalFilename = file.getOriginalFilename();
	    String extension = "";
	    if (originalFilename != null && originalFilename.contains(".")) {
	        extension = originalFilename.substring(originalFilename.lastIndexOf("."));
	    }

	    // UUID�� ����Ͽ� �� ���ϸ� ���� (Ȯ���� ����)
	    String uuid = UUID.randomUUID().toString() + extension;
	    File saveFile = new File(path, uuid);
	    
	    try {
	        file.transferTo(saveFile); // ���� ����
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return uuid; // ����� ���ϸ� ��ȯ (UUID + Ȯ����)
	}

	@Override
	public String writeproduct(ReviewDTO rdto) {
		return mapper.writeproduct(rdto);
	}

}
