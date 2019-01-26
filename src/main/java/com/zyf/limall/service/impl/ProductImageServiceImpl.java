package com.zyf.limall.service.impl;

import com.zyf.limall.mapper.ProductimageMapper;
import com.zyf.limall.pojo.Productimage;
import com.zyf.limall.pojo.ProductimageExample;
import com.zyf.limall.service.ProductImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductImageServiceImpl implements ProductImageService {
    @Autowired
    ProductimageMapper productimageMapper;

    public List<Productimage> list(int pid){
        ProductimageExample example = new ProductimageExample();
        example.or().andPidEqualTo(pid);
        List<Productimage> productimages = productimageMapper.selectByExample(example);
        return productimages;
    }



}
