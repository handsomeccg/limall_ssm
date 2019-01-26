package com.zyf.limall.service.impl;

import com.zyf.limall.mapper.CategoryMapper;
import com.zyf.limall.pojo.Category;
import com.zyf.limall.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.zyf.limall.util.Page;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryMapper categoryMapper;
    @Override
    public List<Category> list(){
        return categoryMapper.list();
    }

    @Override
    public void add(Category category){
        categoryMapper.add(category);
    }
    @Override
    public void delete(int id){
        categoryMapper.delete(id);
    }
    @Override
    public Category get(int id){
        return categoryMapper.get(id);
    }
    @Override
    public void update(Category category){
        categoryMapper.update(category);
    }
}
