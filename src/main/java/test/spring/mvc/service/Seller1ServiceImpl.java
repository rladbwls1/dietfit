package test.spring.mvc.service;

import java.util.List;
import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public void insertProduct(ProductDTO productDTO, ProductimgDTO productimgDTO, String companyid) {
        // 상품 정보 저장
        sellerMapper.insertProduct(productDTO);
        
        // 상품 이미지 정보 저장
        sellerMapper.insertProductImage(productimgDTO);
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
    public List<ProductimgDTO> findthumimg(String companyid, String category2) {
        return sellerMapper.findthumimg(companyid, category2);
    }

    @Override
    public List<ProductimgDTO> findimg(String companyid, String category2) {
        return sellerMapper.findimg(companyid, category2);
    }
}
