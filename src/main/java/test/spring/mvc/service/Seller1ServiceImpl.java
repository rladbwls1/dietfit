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
    // �ִ� ������ ã�� ( �̹��� �����Ҷ� ��� )
    @Override
    public int selectMaxProductSeq(String companyid) {
        return sellerMapper.selectMaxProductSeq(companyid);
    }
    // ��ǰ ���� ����
    @Override
    public void insertProduct(ProductDTO productDTO, String companyid) {
        sellerMapper.insertProduct(productDTO);
    }
    // ��ǰ �̹��� ���� ����
	@Override
	public void insertProductimg(ProductimgDTO productimgDTO, String companyid) {
        sellerMapper.insertProductImage(productimgDTO);
	}
	// ��ǰ �̹��� ���ε� 
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
	// ��ǰ ������ ����
    @Override
    public ProductDTO findproductdetail(String companyid, String category, String category2, String flavor) {
        return sellerMapper.findproductdetail(companyid, category, category2, flavor);
    }
    //���� ����� ����Ʈ
    @Override
    public ProductimgDTO findlistthum(String companyid,String category, String category2) {
        return sellerMapper.findlistthum(companyid, category, category2);
    }
    // ���� �̹��� ����� 
    @Override
    public List<ProductimgDTO> findthumimg(String companyid, String category, String category2) {
        return sellerMapper.findthumimg(companyid, category, category2);
    }
    // ���� �̹��� ÷������
    @Override
    public List<ProductimgDTO> findimg(String companyid, String category, String category2) {
        return sellerMapper.findimg(companyid, category, category2);
    }

    // ��ǰ ���� DB ����
	@Override
	public void deleteProduct(String companyid, String category, String category2, String flavor) {
		sellerMapper.deleteProduct(companyid, category, category2, flavor);
	}
	
	// ��ǰ �̹��� DB ����
	@Override
	public void deleteProductimg(String companyid, String category, String category2, String flavor) {
		sellerMapper.deleteProductimg(companyid, category, category2, flavor);
	}
	
	// ���� ����
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
	
	// ���� �κ� ���� �������� �����
	@Override
	public List<ProductimgDTO> updatethumimg(String companyid, String category, String category2, String flavor) {
	    List<ProductimgDTO> thumimages = sellerMapper.findthumimg(companyid, category, category2);

	    for (ProductimgDTO img : thumimages) {
	        String filename = companyid + category + category2 + flavor + "F" + img.getNum() + img.getExt(); // ���� �̸�
	        img.setFileName(filename);
	    }
		return thumimages;
	}
	
	// ���� �κ� ���� �������� �Ϲ� ÷�� �̹���
	@Override
	public List<ProductimgDTO> updateimg(String companyid, String category, String category2, String flavor) {
	    List<ProductimgDTO> images = sellerMapper.findimg(companyid, category, category2);
	    
	    for (ProductimgDTO img : images) {
	        String filename = companyid + category + category2 + flavor + "F" + img.getNum() + img.getExt();
	        img.setFileName(filename);
	    }
	    return images; 
	}
	
	// ��ǰ ���� ����
	@Override
	public void updateProduct(ProductDTO productDTO) {
		sellerMapper.updateProduct(productDTO);
	}
	
	// ��ǰ �̹��� DB ����
	// �����
	@Override
	public int deleteProductthumimg(List<Integer> thumnums) {
		return sellerMapper.deleteProductthumimg(thumnums);
	}
	// ÷������
	@Override
	public int deleteProductimgnum(List<Integer> imgnums) {
		return sellerMapper.deleteProductimgnum(imgnums);
	}
	
	// ��ǰ �̹��� �������� ����
	// �����
	@Override
	public void fileDeletethumnum(List<String> thumfileNames, String path) {
	    for (String fileName : thumfileNames) {
	        File file = new File(path, fileName);
	        if (file.exists()) {
	            file.delete();
	        }
	    }
	}
	// ÷������
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
			
			// ProductDTO ��ü ���� �� ���� ����
	        ProductDTO ProductDTO = new ProductDTO();
	        ProductDTO.setCompanyid(companyid);
	        ProductDTO.setCategory(category);
	        ProductDTO.setCategory2(category2);
	        ProductDTO.setFlavor(flavor);
			ProductDTO.setProduct(product);
			ProductDTO.setPrice(price);
			// �̹��� ��� ���� �����Ͽ� ����
			String imagePath = "/resources/p_img/" + thumbnailPath.getCompanyid() +
					thumbnailPath.getCategory() + thumbnailPath.getCategory2() +
					thumbnailPath.getFlavor() + "F" + thumbnailPath.getNum() +
					thumbnailPath.getExt();
			ProductDTO.setImagePath(imagePath);
			
			//�����, �̸�, ���� ����
			//list.add(ProductDTO);
			//product�� ���۷� �ҷ�����
			//����ϵ� �ҷ��ͼ� �̹��� �н� �־��
			list.add(ProductDTO);
		}
		
		model.addAttribute("list",list);
	}
	
	

>>>>>>> branch 'main' of https://github.com/rladbwls1/dietfit.git
}