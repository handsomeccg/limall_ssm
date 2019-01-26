package com.zyf.limall.service.impl;

import com.zyf.limall.mapper.ProductMapper;
import com.zyf.limall.pojo.Product;
import com.zyf.limall.pojo.Category;
import com.zyf.limall.service.ProductService;
import com.zyf.limall.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import com.zyf.limall.util.Page;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;
    @Autowired
    ReviewService reviewService;

    @Override
    public List<Product> list(int cid){
        return productMapper.list(cid);
    }

    @Override
    public List<Product> listAll(){ return productMapper.listAll(); }

    @Override
    public void add(Product product){
        productMapper.add(product);
    }
    @Override
    public void delete(int id){
        productMapper.delete(id);
    }
    @Override
    public Product get(int id){
        return productMapper.get(id);
    }
    @Override
    public void update(Product product){
        productMapper.update(product);
    }

    @Override
    public void setReviewCount(Product product){
        int reviewCount = reviewService.getCount(product.getId());
        product.setReviewCount(reviewCount);
    }

    @Override
    public void fill(List<Category> categories) {
        for (Category category : categories) {
            fill(category);
        }
    }

    @Override
    public void fill(Category category) {
        List<Product> products = list(category.getId());
        category.setProducts(products);
    }

    @Override
    public void fillByRow(List<Category> categories) {
        int productNumberOfEachRow = 8;
        for (Category category : categories) {
            List<Product> products = category.getProducts();
            List<List<Product>> productByRow = new ArrayList<>();
            for (int i = 0; i < products.size(); i += productNumberOfEachRow) {
                int size = i + productNumberOfEachRow;
                size = size > products.size() ? products.size() : size;
                List<Product> productsOfEachRow = products.subList(i, size);
                productByRow.add(productsOfEachRow);
            }
            category.setProductByRow(productByRow);
        }
    }
}
