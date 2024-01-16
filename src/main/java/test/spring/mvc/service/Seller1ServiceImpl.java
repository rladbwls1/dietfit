package test.spring.mvc.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import test.spring.mvc.repository.Seller1Mapper;

@Service
public class Seller1ServiceImpl implements Seller1Service {

    @Autowired
    private Seller1Mapper sellerMapper;

    @Override
    public List<ProductDTO> findallproductbycompanyid(String companyid) {
        return sellerMapper.findallproductbycompanyid(companyid);
    }

    @Override
    public int selectMaxProductSeq(String companyid) {
        return sellerMapper.selectMaxProductSeq(companyid);
    }

    @Override
    public void insertProduct(ProductDTO productDTO, String companyid) {
        // 상품 정보 저장
        sellerMapper.insertProduct(productDTO);
    }
    
	@Override
	public void insertProductimg(ProductimgDTO productimgDTO, String companyid) {
		// 상품 이미지 정보 저장
        sellerMapper.insertProductImage(productimgDTO);
	}
	
	@Override
	public void fileUpload(String companyid, String category, String category2, String flavor, MultipartFile file) {
	    String uploadDirectory = "D:\\spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\dietfit\\resources\\p_img";

	    try {
	        // 실제 파일 저장 경로 설정
	        Path uploadPath = Paths.get(uploadDirectory);

	        if (!Files.exists(uploadPath)) {
	            Files.createDirectories(uploadPath);
	        }

	        // 파일 확장자 추출
	        String originalFilename = file.getOriginalFilename();
	        String ext = originalFilename.substring(originalFilename.lastIndexOf("."));

	        // 파일명 조합
	        String filename = companyid + category + category2 + flavor + "F" + selectMaxProductSeq(companyid) + ext;

	        // 파일 저장 경로 설정
	        Path filePath = uploadPath.resolve(filename);

	        // 파일을 저장
	        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

    @Override
    public ProductDTO findproductdetail(String companyid, String category, String category2, String flavor) {
        return sellerMapper.findproductdetail(companyid, category, category2, flavor);
    }

    @Override
    public ProductimgDTO findlistthum(String companyid,String category, String category2) {
        return sellerMapper.findlistthum(companyid, category, category2);
    }

    @Override
    public List<ProductimgDTO> findthumimg(String companyid, String category, String category2) {
        List<ProductimgDTO> thumImages = sellerMapper.findthumimg(companyid, category , category2);
        for (ProductimgDTO img : thumImages) {
            String fileName = filename(img.getCompanyid(), img.getCategory(), img.getCategory2(), img.getFlavor(), img.getExt(), String.valueOf(img.getNum()));
            img.setFileName(fileName);
        }
        return thumImages;
    }

    @Override
    public List<ProductimgDTO> findimg(String companyid, String category, String category2) {
        List<ProductimgDTO> detailImages = sellerMapper.findimg(companyid, category, category2);
        for (ProductimgDTO img : detailImages) {
            String fileName = filename(img.getCompanyid(), img.getCategory(), img.getCategory2(), img.getFlavor(), img.getExt(), String.valueOf(img.getNum()));
            img.setFileName(fileName);
        }
        return detailImages;
    }


	@Override
	public void deleteProduct(String companyid, String category, String category2, String flavor) {
		sellerMapper.deleteProduct(companyid, category, category2, flavor);
	}

	@Override
	public void deleteProductimg(String companyid, String category, String category2, String flavor) {
		sellerMapper.deleteProductimg(companyid, category, category2, flavor);
	}

	@Override
	public void fileDelete(String companyid, String category, String category2, String flavor) {
	    // 파일이 저장된 기본 경로
		String uploadDirectory = "D:\\spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\dietfit\\resources\\p_img";
	    try {
	        // 파일명 구성
	        String filenamePattern = companyid + category + category2 + flavor + "F";
	        // 해당 경로에 있는 모든 파일을 순회하며, 패턴과 일치하는 파일 삭제
	        Files.list(Paths.get(uploadDirectory))
	            .filter(path -> path.getFileName().toString().startsWith(filenamePattern))
	            .forEach(path -> {
	                try {
	                    Files.deleteIfExists(path); 
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	            });
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	@Override
	public void updateProduct(ProductDTO productDTO) {
		sellerMapper.updateProduct(productDTO);
	}

	@Override
	public List<ProductimgDTO> imgfindupdate(String companyid, String category, String category2, String flavor) {
	    List<ProductimgDTO> images = sellerMapper.imgfindupdate(companyid, category, category2, flavor);
	    
	    String basePath = "D:\\spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\dietfit\\resources\\p_img\\";
	    
	    for (ProductimgDTO img : images) {
	        String fullPath = basePath + img.getFileName();
	    }

	    return images;
	}
	
	@Override
    public String filename(String companyid, String category, String category2, String flavor, String ext, int num) {
        return companyid + category + category2 + flavor + "F" + num + ext;
    }

}