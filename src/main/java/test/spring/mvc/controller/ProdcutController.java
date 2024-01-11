package test.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.mvc.bean.ProductDTO;
import test.spring.mvc.service.SellerService;


@Controller
@RequestMapping("/seller/product/*")
public class ProdcutController {

    @Autowired
    private SellerService sellerService;
}


