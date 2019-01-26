package com.zyf.limall.service;

import com.zyf.limall.pojo.Product;
import com.zyf.limall.pojo.Category;
import java.util.List;
import com.zyf.limall.util.Page;


public interface ProductService {
    List<Product> list(int cid);

    List<Product> listAll();
    void add(Product product);
    void delete(int id);

    Product get(int id);
    void update(Product product);
    void setReviewCount(Product product);
    void fill(List<Category> categories);

    /**
     * 为一个分类填充产品集合
     *
     * @param category
     */
    void fill(Category category);

    /**
     * 为多个分类填充产品集合
     *
     * @param categories
     */
    void fillByRow(List<Category> categories);

    /**
     * 为产品填充ReviewCount字段
     *
     * @param product
     */
}