package com.zyf.limall.mapper;

import com.zyf.limall.pojo.Product;
import java.util.List;

public interface ProductMapper {
    List<Product> list(int cid);
    List<Product> listAll();
    void add(Product product);
    void delete(int id);

    Product get(int id);
    void update(Product product);
    List<Product> listKeyword(String keyword);
    void updateStock(int id,int stock);
}