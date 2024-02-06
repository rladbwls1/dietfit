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
	public List<ReviewDTO> list() {
		return mapper.list();
	}

	@Override
	public List<AllimgDTO> img(int num) {
		return mapper.img(num);
	}

	@Override
	public ReviewDTO write(ReviewDTO rdto) {
		return mapper.write(rdto);
	}

	@Override
	public AllimgDTO writeimg(AllimgDTO adto) {
		return mapper.writeimg(adto);
	}

	@Override
	public String fileupload(MultipartFile file, String path) {
	    String uuid = UUID.randomUUID().toString();
	    File saveFile = new File(path, uuid);
	    try {
	        file.transferTo(saveFile);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return uuid;
	}
}
