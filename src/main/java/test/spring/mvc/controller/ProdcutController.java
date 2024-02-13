package test.spring.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.bean.ProductimgDTO;
import test.spring.mvc.service.Seller1Service;
import test.spring.mvc.service.SellerService;


@Controller
@RequestMapping("diet/product/*")
public class ProdcutController {

    @Autowired
    private SellerService sellerService;
    
}

