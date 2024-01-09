package test.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.repository.Seller1Mapper;

@Service
public class Seller1ServiceImpl implements Seller1Service{
	@Autowired
    private Seller1Mapper sellerMapper;
    
    @Override
    public int getMaxProductSeq() {
        return sellerMapper.selectMaxProductSeq();
    }

	@Override
    public void insertProduct(ProductDTO productDTO, ProductimgDTO productimgDTO,String companyid) {
        sellerMapper.insertProduct(productDTO);
        sellerMapper.insertProductImage(productimgDTO);
	}

	@Override
	public String selectcompanyid(String companyid) {
		return sellerMapper.selectcompanyid(companyid);
	}
}
