package test.spring.mvc.service;

import java.io.File;
import java.io.FilenameFilter;
import java.util.List;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.bean.SetproductDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
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
    // 최대 시퀀스 찾기 ( 이미지 저장할때 사용 )
    @Override
    public int selectMaxProductSeq(String companyid) {
        return sellerMapper.selectMaxProductSeq(companyid);
    }
    // 상품 정보 저장
    @Override
    public void insertProduct(ProductDTO productDTO, String companyid) {
        sellerMapper.insertProduct(productDTO);
    }
    // 상품 이미지 정보 저장
	@Override
	public void insertProductimg(ProductimgDTO productimgDTO, String companyid) {
        sellerMapper.insertProductImage(productimgDTO);
	}
	// 상품 이미지 업로드 
	@Override
	public void fileUpload(String companyid, String category, String category2, String flavor, MultipartFile file, String path) {
		String originalFilename = file.getOriginalFilename();
        String ext = originalFilename.substring(originalFilename.lastIndexOf(".")); 
        String filename = companyid + category + category2 + flavor + "F" + selectMaxProductSeq(companyid) + ext;
        File saveFile = new File(path, filename);
        try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 상품 디테일 정보
    @Override
    public ProductDTO findproductdetail(String companyid, String category, String category2, String flavor) {
        return sellerMapper.findproductdetail(companyid, category, category2, flavor);
    }
    //파일 썸네일 리스트
    @Override
    public ProductimgDTO findlistthum(String companyid,String category, String category2) {
        return sellerMapper.findlistthum(companyid, category, category2);
    }
    // 실제 이미지 썸네일 
    @Override
    public List<ProductimgDTO> findthumimg(String companyid, String category, String category2) {
        return sellerMapper.findthumimg(companyid, category, category2);
    }
    // 실제 이미지 첨부파일
    @Override
    public List<ProductimgDTO> findimg(String companyid, String category, String category2) {
        return sellerMapper.findimg(companyid, category, category2);
    }

    // 상품 정보 DB 삭제
	@Override
	public void deleteProduct(String companyid, String category, String category2, String flavor) {
		sellerMapper.deleteProduct(companyid, category, category2, flavor);
	}
	
	// 상품 이미지 DB 삭제
	@Override
	public void deleteProductimg(String companyid, String category, String category2, String flavor) {
		sellerMapper.deleteProductimg(companyid, category, category2, flavor);
	}
	
	// 파일 삭제
	@Override
	public void fileDelete(String companyid, String category, String category2, String flavor, String path) {
	    File dir = new File(path);
	    String targetPattern = companyid + category + category2 + flavor + "F";

	    File[] matchingFiles = dir.listFiles(new FilenameFilter() {
	        public boolean accept(File dir, String name) {
	            return name.startsWith(targetPattern);
	        }
	    });

	    if (matchingFiles != null) {
	        for (File file : matchingFiles) {
	            file.delete();
	        }
	    }
	}
	
	// 수정 부분 사진 가져오기 썸네일
	@Override
	public List<ProductimgDTO> updatethumimg(String companyid, String category, String category2, String flavor) {
	    List<ProductimgDTO> thumimages = sellerMapper.findthumimg(companyid, category, category2);

	    for (ProductimgDTO img : thumimages) {
	        String filename = companyid + category + category2 + flavor + "F" + img.getNum() + img.getExt(); // 파일 이름
	        img.setFileName(filename);
	    }
		return thumimages;
	}
	
	// 수정 부분 사진 가져오기 일반 첨부 이미지
	@Override
	public List<ProductimgDTO> updateimg(String companyid, String category, String category2, String flavor) {
	    List<ProductimgDTO> images = sellerMapper.findimg(companyid, category, category2);
	    
	    for (ProductimgDTO img : images) {
	        String filename = companyid + category + category2 + flavor + "F" + img.getNum() + img.getExt();
	        img.setFileName(filename);
	    }
	    return images; 
	}
	
	// 상품 정보 수정
	@Override
	public void updateProduct(ProductDTO productDTO) {
		sellerMapper.updateProduct(productDTO);
	}
	
	// 상품 이미지 DB 삭제
	// 썸네일
	@Override
	public int deleteProductthumimg(List<Integer> thumnums) {
		return sellerMapper.deleteProductthumimg(thumnums);
	}
	// 첨부파일
	@Override
	public int deleteProductimgnum(List<Integer> imgnums) {
		return sellerMapper.deleteProductimgnum(imgnums);
	}
	
	// 상품 이미지 실제파일 삭제
	// 썸네일
	@Override
	public void fileDeletethumnum(List<String> thumfileNames, String path) {
	    for (String fileName : thumfileNames) {
	        File file = new File(path, fileName);
	        if (file.exists()) {
	            file.delete();
	        }
	    }
	}
	// 첨부파일
	@Override
	public void fileDeleteimgnum(List<String> imgfileNames, String path) {
	    for (String fileName : imgfileNames) {
	        File file = new File(path, fileName);
	        if (file.exists()) {
	            file.delete();
	        }
	    }
	}
<<<<<<< HEAD
=======

	@Override
	public void getProductByCookie(List<String> recentlyViewedProducts,Model model) {
		List<ProductDTO> list=new ArrayList<>();
		for(String ProductCode:recentlyViewedProducts) {
			String companyid=ProductCode.substring(0,2);
			String category=ProductCode.substring(2,4);
			String category2=ProductCode.substring(4,6);
			String flavor=ProductCode.substring(6,8);
			
			String product = sellerMapper.findproductdetail(companyid, category, category2, flavor).getProduct();
			String price = sellerMapper.findproductdetail(companyid, category, category2, flavor).getPrice();
			ProductimgDTO thumbnailPath = findlistthum(companyid, category, category2);
			
			// ProductDTO 객체 생성 및 정보 설정
	        ProductDTO ProductDTO = new ProductDTO();
	        ProductDTO.setCompanyid(companyid);
	        ProductDTO.setCategory(category);
	        ProductDTO.setCategory2(category2);
	        ProductDTO.setFlavor(flavor);
			ProductDTO.setProduct(product);
			ProductDTO.setPrice(price);
			// 이미지 경로 직접 조합하여 설정
			String imagePath = "/resources/p_img/" + thumbnailPath.getCompanyid() +
					thumbnailPath.getCategory() + thumbnailPath.getCategory2() +
					thumbnailPath.getFlavor() + "F" + thumbnailPath.getNum() +
					thumbnailPath.getExt();
			ProductDTO.setImagePath(imagePath);
			
			//썸네일, 이름, 가격 꺼내
			//list.add(ProductDTO);
			//product를 메퍼로 불러오고
			//썸네일도 불러와서 이미지 패스 넣어라
			list.add(ProductDTO);
		}
		
		model.addAttribute("list",list);
	}
	
	

>>>>>>> branch 'main' of https://github.com/rladbwls1/dietfit.git
}